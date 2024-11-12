#################################################
#                                               #
#            csum - Checkfile Module            #
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

module CheckFile
  def self.is_valid_path?(path : String) : Int32
    if File.exists?(path)
      return 0
    else
      return -1
    end
  end

  def self.is_file?(path : String) : Int32
    if File.exists?(path) && File.info(path).file?
      return 0
    else
      return -1
    end
  end
end
