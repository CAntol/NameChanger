require 'fileutils'

if ARGV.length != 2
	puts "This program changes all the filenames in a directory to the specified name with a trailing index\nUsage: ruby namechanger.rb {folder path} {name to use}"
else
	folder = ARGV[0]
	name_prefix = ARGV[1]
	counter = 0

	if File.directory? folder

		Dir.entries(folder).each {|file|
			unless File.directory? file
				tmp = file.split(".")
				if tmp.length >= 2
					FileUtils.mv "#{folder}/#{file}", "#{folder}/#{name_prefix}-#{counter}.#{tmp[-1]}"
				else
					FileUtils.mv "#{folder}/#{file}", "#{folder}/#{name_prefix}-#{counter}"
				end
				counter += 1
			end
		}
		puts "Success!"

	else
		puts "Invalid folder"
	end

end
