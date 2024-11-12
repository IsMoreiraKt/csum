#################################################
#                                               #
#             csum - CheckSum Module            #
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

require "../utils/check-sum-algorithms.cr"
require "../utils/display.cr"

module CheckSum
  def self.checksum(resstream, length, algorithm_version, file_path = STDIN)
    if file_path.is_a?(IO::FileDescriptor)
      file = file_path
      verify_version(resstream, length, algorithm_version, file)
      Display.output(" ", resstream, length)
    else
      file = File.open(file_path, "r")
      verify_version(resstream, length, algorithm_version, file)
      Display.output(file_path, resstream, length)
    end
  end

  def self.verify_version(resstream, length, algorithm_version, file)
    if algorithm_version == 0
      CheckSumAlgorithms.bsd_sum_stream(file, resstream, length)
    else
      CheckSumAlgorithms.sysv_sum_stream(file, resstream, length)
    end
  end
end
