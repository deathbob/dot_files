
# holy god, this file is the result of a lot of yak shaving.  Treasure it

gem_path = `gem environment gemdir`.chomp
gem_path << '/gems'

Dir.foreach(gem_path) do |d|
  ($LOAD_PATH << d + '/lib') if File.stat(d).directory?
end

require 'pp'
require 'irb/completion'
require 'wirble'
require 'what_methods'

Wirble.init
Wirble.colorize


class Object
  def bob_methods
    (self.methods - Object.new.methods).sort
  end
end
