require File.join(File.dirname(__FILE__), 'spec_helper')

describe Github::Issue do
  it "should be possible to parse an issue" do
    issue = Github::Issue.new("position" => 1.0,
      "number" => 1,
      "votes" => 0,
      "created_at" => Time.parse("2011-04-18 21:00:31 +0200"),
      "comments" => 0,
      "body" => "",
      "title" => "General Layout",
      "updated_at" => Time.parse("2011-04-18 22:56:17 +0200"),
      "closed_at" => Time.parse("2011-04-18 22:56:17 +0200"),
      "gravatar_id" => "e372514c922684dfb07578aa59e5a2b8",
      "html_url" => "https://github.com/inovex/inovex.de/issues/1",
      "user" => "threez",
      "labels" => [],
      "state" => "closed")
    issue.title.should == "General Layout"
    issue.closed?.should == true
  end
  
  it "should be possible to handle the comments correctly" do
    issue = Github::Issue.new("position" => 1.0,
      "number" => 1,
      "votes" => 0,
      "created_at" => Time.parse("2011-04-18 21:00:31 +0200"),
      "comments" => 0,
      "body" => "",
      "title" => "General Layout",
      "updated_at" => Time.parse("2011-04-18 22:56:17 +0200"),
      "closed_at" => Time.parse("2011-04-18 22:56:17 +0200"),
      "gravatar_id" => "e372514c922684dfb07578aa59e5a2b8",
      "html_url" => "https://github.com/inovex/inovex.de/issues/1",
      "user" => "threez",
      "labels" => [],
      "state" => "closed")
    issue.comments_count.should == 0
    issue.comments.should == []
    issue.has_comments?.should be_false
  end
end
