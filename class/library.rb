require './class/author.rb'
require './class/book.rb'
require './class/order.rb'
require './class/reader.rb'
require './seed.rb'
require 'faker'
require 'yaml'
require 'pp'
# Main class
class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def import_data(filename)
    library = YAML.load_file(filename)
    @authors = library.authors
    @books = library.books
    @readers = library.readers
    @orders = library.orders
  end

  def generate(filename)
    generate_data
    File.open(filename, 'w+') { |data| data.write(self.to_yaml) }
  end

  def top_reader_books
    n_top(1, :readers).to_h.keys.flatten.first.name
  end

  def most_popular
    n_top(1, :books).to_h.keys.flatten.first.book
  end

  def top_three_books
    book = n_top(3, :books).flatten
    @orders.map { |order| order.readers if book.include? order.books }.compact.uniq.size
  end

  def n_top(n, mod_name)
    @orders.group_by(&mod_name).max_by(n) { |_key, val| val.size }
  end
end
