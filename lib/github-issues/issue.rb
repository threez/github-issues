class Github::Issue
  attr_accessor :position, :number, :votes, :created_at, :body, :labels, :state,
                :title, :updated_at, :closed_at, :gravatar_id, :html_url, :user,
                :comments_count, :diff_url, :patch_url, :pull_request_url,
                :repository
  
  # Initialize the issue using the passed fields.
  # @param [Hash] fields the fields that will initialize the comment.   
  def initialize(fields = {})
    fields.each { |name, value| self.send("#{name}=", value) }
  end
  
  # Returns true if the issue is closed
  def closed?
    state == "closed"
  end
  
  # Returns true if the issue is open
  def open?
    state == "open"
  end
  
  # This updates the comments on an issue. The API returns here the number of 
  # comments. Not the actual comments.
  # @param [Fixnum] count the count of existing comments
  def comments=(count)
    @comments_count = count
  end
  
  # Returns true if the issue has comments.
  def has_comments?
    @comments_count > 0
  end
  
  # Fetches the comments only if the issue has some.
  # @return [Array<Github::Issue::Comment>] the comments that belong to that 
  # issue
  def comments
    if has_comments?
      @repository.load(:comments, number).map do |item|
        Github::Issue::Comment.new(item)
      end
    else  
      []
    end
  end
end
