# book
class Book
  attr_accessor :book, :title

  def initialize(book, title)
    @title = title
    @book = book
  end
end
