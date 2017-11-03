# if ENV['VERSION'].present?
#   seed_files = Dir[File.join(File.dirname(__FILE__), 'seeds', "*#{ENV['VERSION']}*.rb")]
#   raise "No seed files found matching '#{ENV['VERSION']}'" if seed_files.empty?
# else
#   seed_files = Dir[File.join(File.dirname(__FILE__), 'seeds', '*.rb')]
# end

# puts(seed_files)

# seed_files.sort_by{|f| File.basename(f).to_i}.each do |file|
#   require File.join(File.dirname(__FILE__), 'seeds', File.basename(file, File.extname(file)))
# end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }