class Github::Issue::Comment
  attr_accessor :gravatar_id, :created_at, :body, :updated_at, :id, :user
  
  # Initialize the comment using the passed fields.
  # @param [Hash] fields the fields that will initialize the comment.
  def initialize(fields = {})
    fields.each { |name, value| self.send("#{name}=", value) }
  end
end
