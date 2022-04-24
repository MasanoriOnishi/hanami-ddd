class NewBook < Hanami::Entity
  MAX_TITLE_SIZE = 20
  def self.create(id:, title:, author: "作者不明", created_at: Time.now, updated_at: Time.now)
    if title.size >= MAX_TITLE_SIZE
      raise ArgumentError, "titleは#{MAX_TITLE_SIZE}文字までです。"
    end

    self.new(
      id: id,
      title: title,
      author: author,
      created_at: created_at,
      updated_at: updated_at,
    )
  end
end
