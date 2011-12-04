lib = File.join(File.dirname(__FILE__), "github-issues")

require "open-uri"
require "yaml"
require File.join(lib, "github")
require File.join(lib, "issue")
require File.join(lib, "comment")
