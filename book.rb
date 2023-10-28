class Book
  attr_accessor :title, :author, :rentals

  @all_books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all_books << self
  end

  class << self
    attr_reader :all_books
  end

  def self.find_by_title(title)
    @all_books.find { |book| book.title == title }
  end
end
