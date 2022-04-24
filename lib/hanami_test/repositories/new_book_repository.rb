class NewBookRepository < Hanami::Repository
  def store(book)
    new_books.insert(
      id: book.id,
      title: book.title,
      author: book.author,
      created_at: book.created_at,
      updated_at: book.updated_at,
    )
  end
end
