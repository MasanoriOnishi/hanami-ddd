class NewBookRepository < Hanami::Repository
  def store(book)
    new_books.insert(book.to_h)
  end
end
