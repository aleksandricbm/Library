# order
class Order
  attr_accessor :readers, :books, :date

  def initialize(books, readers, date)
    @books = books
    @readers = readers
    @date = date
  end
end
