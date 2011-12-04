require File.join(File.dirname(__FILE__), 'spec_helper')

describe Github do
  it "should connect to the remote rails repository" do
    repo = Github.connect(USERNAME, REPO)
    repo.username.should == USERNAME
    repo.repository_name.should == REPO
  end
  
  context "with rails repo" do
    before(:each) do
      @repo = Github.connect(USERNAME, REPO)
    end
    
    it "should return the correct repo path" do
      @repo.url(:list).should == \
        "http://github.com/api/v2/yaml/issues/list/#{USERNAME}/#{REPO}"
    end
    
    it "should return an issues proxy object" do
      @repo.issues.should be_a(Github::IssuesProxy)
    end

    it "should find tickets" do
      @repo.issues.all.should_not be_empty
    end
    
    it "should filter tickets by state" do
      open = @repo.issues.all(:open)
      closed = @repo.issues.all(:closed)
      open.should_not be_empty
      closed.should_not be_empty
      open.should_not == closed
    end
    
    it "should be possible to fetch an issue" do
      issue = @repo.issues.find(10)
      issue.has_comments?.should be_true
      issue.comments_count.should > 0
      issue.comments.should_not be_empty
    end
  end
end
