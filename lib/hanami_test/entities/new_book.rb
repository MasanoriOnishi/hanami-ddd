class NewBook < Hanami::Entity
  attr_accessor :id, :title, :author

  def initialize(attributes = {})
    @id, @title, @author = attributes.values_at(:id, :title, :author)
  end
end
