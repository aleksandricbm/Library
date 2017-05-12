require_relative 'class/library.rb'

filename = './example.yml'
library = Library.new

library.generate(filename) unless File.exist?(filename)
library.import_data(filename)

puts "Who often takes the book: ' #{library.top_reader_books} ' "
puts ''
puts "What is the most popular book: '#{library.most_popular}'"
puts ''
puts "many most popular books: ' #{library.top_three_books} ' "
