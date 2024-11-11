#################################################
#                                               #
#          csum - ColorSupport Module           #
#                                               #
#                                               #
# This module is part of the csum project,      #
# a checksum utility based on BSD's `sum`. It   #
# was created for educational purposes to show  #
# how checksums work and to learn about system  #
# programming.                                  #
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

module ColorSupport
  @@GREEN = ""
  @@RED = ""
  @@YELLOW = ""
  @@RESET = ""
  @@BOLD = ""

  def self.support_colors? : Bool
    return false unless ENV["TERM"]
    return true if ENV["TERM"].includes?("color") ||
                   ENV["TERM"].includes?("256color")
    return false
  end

  def self.green
    @@GREEN
  end

  def self.red
    @@RED
  end

  def self.yellow
    @@YELLOW
  end

  def self.reset
    @@RESET
  end

  def self.bold
    @@BOLD
  end
end
