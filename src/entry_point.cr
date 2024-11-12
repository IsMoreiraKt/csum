#################################################
#                                               #
#           csum - Entry Point Module           #
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

require "option_parser"
require "./utils/check-file.cr"
require "./utils/colors.cr"
require "./commands/help.cr"
require "./commands/version.cr"
require "./commands/checksum.cr"

ColorSupport.set_colors
resstream = Pointer(Int32).malloc
length = Pointer(UInt64).malloc

OptionParser.parse(ARGV) do |parser|
  parser.on("-r", "Use BSD checksum algorithm (default)") do
    if ARGV.any?
      ARGV.shift
      file_path = ARGV.first

      if CheckFile.is_valid_path?(file_path) == -1
        puts "#{ColorSupport.red}Invalid path: #{file_path}#{ColorSupport.reset}"
        exit
      end
      if CheckFile.is_file?(file_path) == -1
        puts "#{ColorSupport.red}#{file_path}: Is a directory#{ColorSupport.reset}"
        exit
      end

      CheckSum.checksum(resstream, length, 0, file_path)
      exit
    else
      CheckSum.checksum(resstream, length, 0, STDIN)
      exit
    end
  end

  parser.on("-s", "Use SYSV checksum algorithm") do
    ARGV.shift
    if ARGV.any?
      file_path = ARGV.first

      if CheckFile.is_valid_path?(file_path) == -1
        puts "#{ColorSupport.red}Invalid path: #{file_path}#{ColorSupport.reset}"
        exit
      end
      if CheckFile.is_file?(file_path) == -1
        puts "#{ColorSupport.red}#{file_path}: Is a directory#{ColorSupport.reset}"
        exit
      end

      CheckSum.checksum(resstream, length, 1, file_path)
      exit
    else
      CheckSum.checksum(resstream, length, 1, STDIN)
      exit
    end
  end

  parser.on("-h", "--help", "Show help message") do
    ARGV.shift
    Help.show_help
    exit
  end

  parser.on("-v", "--version", "Show version information") do
    ARGV.shift
    CheckVersion.show_version
    exit
  end
end

if ARGV.size == 1
  file_path = ARGV.first

  if CheckFile.is_valid_path?(file_path) == -1
    puts "#{ColorSupport.red}Invalid path: #{file_path}#{ColorSupport.reset}"
    exit
  end
  if CheckFile.is_file?(file_path) == -1
    puts "#{ColorSupport.red}#{file_path}: Is a directory#{ColorSupport.reset}"
    exit
  end

  CheckSum.checksum(resstream, length, 0, file_path)
  exit
end

if ARGV.size == 0
  CheckSum.checksum(resstream, length, 0, STDIN)
  exit
end
