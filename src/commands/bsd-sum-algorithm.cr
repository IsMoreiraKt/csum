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

module BSDSumAlgorithm
  def self.bsd_sum_stream(input : IO, resstream : Pointer(Int32), length : Pointer(UInt64)) : Int32
    buffer_length = 32_768
    buffer = Bytes.new(buffer_length)
    checksum = 0
    total_bytes = 0_u64

    loop do
      bytes_read = input.read(buffer) || 0
      break if bytes_read == 0

      sum = 0

      while sum < bytes_read
        checksum = (checksum >> 1) + ((checksum & 1) << 15)
        checksum += buffer[sum]
        checksum &= 0xffff
        sum += 1
      end

      total_bytes += bytes_read.to_u64

      if total_bytes < bytes_read.to_u64
        return -1
      end
    end
  end
end
