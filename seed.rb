def generate_data
  @authors, @books, @readers, @orders = []
  5.times { @authors << Author.new(Faker::Book.unique.author) }
  5.times { @books << Book.new(Faker::Book.unique.title, @authors.sample) }
  5.times { @readers << Reader.new(Faker::Name.first_name, Faker::Internet.unique.email, Faker::Address.city, Faker::Address.street_name, Faker::Address.building_number) }
  10.times { @orders << Order.new(@books.sample, @readers.sample, Time.at(rand * Time.now.to_i)) }
end
