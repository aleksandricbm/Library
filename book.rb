class Book
	attr_accessor :authors
	def initialize()
		generate_file_books if !File.file? ('example.yml')
		read_file_books
	end

	def generate_file_books
		f = File.open('example.yml','w')
		20.times do
		 ln = {"author" => Faker::Name.name, "title"=>Faker::Name.title,"biography" => Faker::Lorem.sentence}
		 f.puts ln.to_yaml
		end
		f.close()
		puts "generate_file_book";
	end

	def read_file_books
		if File.exist?("example.yml")
    		@authors = YAML::load_stream( File.open("example.yml"))
    		puts "read file books"
    	end
	end

end