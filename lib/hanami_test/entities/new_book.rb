class NewBook < Hanami::Entity
  def self.create(id:, title:, author:, created_at: Time.now, updated_at: Time.now)
    self.new(
      id: id,
      title: title,
      author: author,
      created_at: created_at,
      updated_at: updated_at,
    )
  end
end
