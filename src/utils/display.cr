#################################################
#                                               #
#             csum - Display Module             #
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

module Display
  def self.output_bsd(file : String, resstream : Pointer(Int32), args : Bool, length : UInt64)
    hbuf = ""
    checksum = resstream.value

    blocks = (length + 511) / 512

    printf("%d %d", checksum, blocks)

    if args
      print " ", file
    end
  end
end
