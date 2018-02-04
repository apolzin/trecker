class FileTrecker
	def initialize
		@myself = File.basename(__FILE__)
	end
	def all_files
		files = []
		Dir.glob('**/*').each do |f|
			files << f
		end
	end
	def last_resort(file)
		ps = `ps aux | grep #{file}`.each_line do |line|
			unless file.nil? || file == false
				if line.include? File.basename(file)
					unless line.include?('aux') || line.include?('grep') || line.include?('ruby')
						puts "#{file} most likely open"
					end
				end
			end
		end
	end
end
foo = FileTrecker.new
bar = foo.all_files
foo.all_files.each do |f|
	foo.last_resort(f)
end
