#################################################
#                                               #
#             csum - Version Module             #
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

require "../utils/colors.cr"

module CheckVersion
  def self.show_version
    puts "#{ColorSupport.bold}csum 0.1#{ColorSupport.reset}"
    puts "#{ColorSupport.cyan}Copyright (C) 2022 Free Software Foundation, Inc.#{ColorSupport.reset}"
    puts "#{ColorSupport.cyan}License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.#{ColorSupport.reset}"
    puts "#{ColorSupport.cyan}This is free software: you are free to change and redistribute it.#{ColorSupport.reset}"
    puts "#{ColorSupport.red}There is NO WARRANTY, to the extent permitted by law.#{ColorSupport.reset}"
    puts "#{ColorSupport.yellow}Originally written by #{ColorSupport.magenta}Kayvan Aghaiepour#{ColorSupport.reset}#{ColorSupport.yellow} and #{ColorSupport.reset}#{ColorSupport.magenta}David MacKenzie#{ColorSupport.reset}#{ColorSupport.yellow} and adapted by #{ColorSupport.reset}#{ColorSupport.magenta}Ismael Moreira#{ColorSupport.reset}."
  end
end
