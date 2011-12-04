# Github Issues

This is a little API that gives easy access to the github issues. I started the project because I had to move tickets from github to redmine.

The API is called using ``URI.open`` and YAML for serialization.

**Note: this is currently a read-only API, also this just covers version 2 of the API**

## Installing

    gem install github-issues
    
## Usage
    
### Connecting to the issues host

In order to access the information on the github repository one has to make a connection to the remote repository.

    repo = Github.connect("threez", "github-issues")

### Reading all issues

This will return all issues found on the repository.

    repo.issues.all # => [Github::Issue, ...]
    
### Reading just open or closed issues

Filter which issues should be displayed.

    repo.issues.all(:open) # => [Github::Issue, ...]
    repo.issues.all(:closed) # => [Github::Issue, ...]
    
### Getting informations about a issue

access all the information of an issue easily:

    issue.number # => 64
    issue.createt_at # => Time
    issue.comments # => [Github::Issue::Comment, ...]

### Comments in an issue

    comment.user # => "threez"
    comment.body # => "close #34 (implemented read-only part)"
