#################################################
#                                               #
#         csum - BSDSumAlgorithm Module         #
#                                               #
#                                               #
# This module is part of the csum project,      #
# a checksum utility based on coreutils `sum`.  #
# It was created for educational purposes to    #
# show how checksums work and to learn about    #
# system programming.                           #
#                                               #
# The csum project is licensed under the GPL    #
# version 3.0 or later.                         #
#                                               #
# You can find the source code at:              #
# https://github.com/IsMoreiraKt/csum           #
#                                               #
# This module is inspired by the original BSD   #
# `sum` utility, which can be found here:       #
# https://github.com/coreutils/coreutils        #
#                                               #
#################################################

module CheckSumAlgorithms
  def self.bsd_sum_stream(input : IO, resstream : Pointer(Int32), length : Pointer(UInt64)) : Int32
    buffer_length = 32768
    buffer = Bytes.new(buffer_length)
    sum = 0
    checksum = 0
    total_bytes = 0_u64

    loop do
      bytes_read = input.read(buffer) || 0
      sum += bytes_read

      break if bytes_read == 0

      sum.times do |i|
        checksum = (checksum >> 1) + ((checksum & 1) << 15)
        checksum += buffer[i]
        checksum &= 0xffff
      end

      if total_bytes + sum.to_u64 < total_bytes
        return -1
      end

      total_bytes += sum.to_u64
    end

    resstream.value = checksum
    length.value = total_bytes

    return 0
  rescue ex
    return -1
  end
end
