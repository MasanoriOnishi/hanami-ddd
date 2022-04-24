class NewBookRepository < Hanami::Repository
  def store(book)
    new_books.insert(
      id: book.id,
      title: book.title,
      author: book.author,
    )
  end
end
