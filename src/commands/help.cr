#################################################
#                                               #
#            csum - Help Command                #
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

def show_help
  puts "#{ColorSupport.bold}Usage: csum [OPTION]... [FILE]...#{ColorSupport.reset}"
  puts "#{ColorSupport.green}Display or verify BSD (16-bit) checksums.#{ColorSupport.reset}"
  puts "\n"

  puts "#{ColorSupport.yellow}If no FILE is specified, or if FILE is -, reads from standard input.#{ColorSupport.reset}"
  puts "\n"

  puts "\t #{ColorSupport.green}-r#{ColorSupport.reset} \t\t\t use the default BSD sum algorithm, operating with 1K blocks."
  puts "\t #{ColorSupport.green}-s, \t --sysv#{ColorSupport.reset} \t use the System V sum algorithm, operating with 512-byte blocks."
  puts "\t\t #{ColorSupport.green}--help#{ColorSupport.reset} \t show this help message and exit."
  puts "\t\t #{ColorSupport.green}--version#{ColorSupport.reset} \t show version information and exit."
end
