class Reader
	attr_accessor :readers
	def initialize()
		generate_file_readers if !File.file? ('reader_example.yml')
		read_file_readers
	end

	def generate_file_readers
		f = File.open('reader_example.yml','w')
		30.times do
		 ln = {"name_r"=>Faker::Name.name,"email" =>Faker::Internet.email, "city"=>Faker::Address.city,"street"=>Faker::Address.street_address,"house"=>Faker::Address.building_number}
		 f.puts ln.to_yaml
		end
		f.close()
		puts "generate_file_reader";
	end

	def read_file_readers
		if File.exist?("reader_example.yml")
    		@readers = YAML::load_stream( File.open("reader_example.yml"))
    		puts "read file readers"
    	end
	end
end