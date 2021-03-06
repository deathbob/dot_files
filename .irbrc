#gem_path = `gem environment gemdir`.chomp
#gem_path << '/gems/'
#Dir.foreach(gem_path) do |d|
#  $LOAD_PATH << gem_path + d + '/lib/'
#end

require 'rubygems'
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

IRB.conf[:PROMPT][:SHORT] = {
  :PROMPT_C=>"%03n:%i* ",
  :RETURN=>"%s\n",
  :PROMPT_I=>"%03n:%i> ",
  :PROMPT_N=>"%03n:%i> ",
  :PROMPT_S=>"%03n:%i%l "
}

IRB.conf[:PROMPT_MODE] = :SHORT
# Adds readline functionality
IRB.conf[:USE_READLINE] = true
# Auto indents suites
IRB.conf[:AUTO_INDENT] = true


require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history" 

# Why's aorta method to edit an object in YAML, awesome!
# Source: http://rubyforge.org/snippet/detail.php?type=snippet&id=22
# require 'yaml'
# def aorta( obj )
#   tempfile = File.join('/tmp',"yobj_#{ Time.now.to_i }")
#   File.open( tempfile, 'w' ) { |f| f << obj.to_yaml }
#   system( "#{ ENV['EDITOR'] || 'vi' } #{ tempfile }" )
#   return obj unless File.exists?( tempfile )
#   content = YAML::load( File.open( tempfile ) )
#   File.delete( tempfile )
#   content
# end

if ENV['RAILS_ENV']
  # Called after the irb session is initialized and Rails has been loaded
  IRB.conf[:IRB_RC] = Proc.new do
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
    ActiveResource::Base.logger = logger
  end
end

