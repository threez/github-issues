class Github < Struct.new(:username, :repository_name, :protocol)
  # Connects to the remote repository
  # @param [String, Symbol] username the name of the user or organization
  # @param [String, Symbol] repository_name the name of the repository
  # @param [Boolean] secure the connection using https
  # @return a new github instance for that repository
  def self.connect(username, repository_name, secure = false)
    new(username.to_s, repository_name.to_s, secure ? "https" : "http")
  end
  
  # This class handles the requests on the list of issues
  # @visibility private
  class IssuesProxy
    # Initializes the issues proxy with the passed repository.
    # @param [Github] repository the repository to connect to
    def initialize(repository)
      @repository = repository
    end
    
    # Returns all the tickets of a repository. A filter can be passed to reduce
    # the number of tickets.
    # @param [Symbol] state the state to filter for (:open or :close)
    def all(state = :all)
      if state == :all
        all(:open) + all(:closed)
      else
        @repository.load(:list, state, :issues).map do |fields| 
          issue = Github::Issue.new(fields)
          issue.repository = @repository
          issue
        end
      end
    end
    
    # Returns the issue identified by the passed id.
    # @param [Fixnum] issue_id the issue to find
    def find(issue_id)
      issue = Github::Issue.new(@repository.load(:show, issue_id, :issue))
      issue.repository = @repository
      issue
    end
  end
  
  # Returns the general url to the repository.
  # @param [String] action the action that should be inserted into the url
  # @param [String, Fixnum, Symbol] filter the filter for the url
  # @return [String] the url for the issue
  def url(action, filter = nil)
    "#{protocol}://github.com/api/v2/yaml/issues/#{action}/" \
    "#{username}/#{repository_name}" + (filter ? "/#{filter}" : "")
  end
  
  # Returns the structure (the hash) found by the resource criteria.
  # @param [String] action the action that should be inserted into the url
  # @param [String, Fixnum, Symbol] filter the filter for the url
  # @param [Symbol] name of the resource by default the action name
  # @return [Hash] the structure of the remote resource
  def load(action, filter = nil, name = nil)
    YAML.load(open(url(action, filter)))[(name || action).to_s]
  end
  
  # Returns an issues proxy object
  # @return [IssuesProxy] the proxy
  def issues
    IssuesProxy.new(self)
  end
end
