#!/usr/bin/ruby

require 'pathname'

def usage
  puts 'Usage: zippass.ruby <path>>'
  exit(1)
end

file = ARGV[0]

usage unless file

path = Pathname(file)
Dir.chdir(path.dirname) do
  org_name = path.basename
  zip_name = "#{org_name}.zip"
  system("zip #{zip_name} #{org_name}")
  system("zipcloak #{zip_name}")
  puts "succeed: #{path.dirname + zip_name}"
end
