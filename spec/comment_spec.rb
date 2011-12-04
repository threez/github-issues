require File.join(File.dirname(__FILE__), 'spec_helper')

describe Github::Issue::Comment do
  it "should be possible to parse a comment" do
    comment = Github::Issue::Comment.new(
      "gravatar_id" => "8194993afda83d34c94928134b729276",
      "created_at" => Time.parse("2010/05/05 15:15:53 -0700"),
      "body" => "Showing off the issues app.",
      "updated_at" => Time.parse("2010/05/05 15:15:53 -0700"),
      "id" => 230935,
      "user" => "280north"
    )
    comment.user.should == "280north"
    comment.body.should == "Showing off the issues app."
  end
end
