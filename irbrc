# ruby 1.8.7 compatible
require 'pp'
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

# interactive editor: use vim from within irb
#begin
  #require 'interactive_editor'
#rescue LoadError => err
  #warn "Couldn't load interactive_editor: #{err}"
#end

# awesome print
#begin
  #require 'awesome_print'
  #AwesomePrint.irb!
#rescue LoadError => err
  #warn "Couldn't load awesome_print: #{err}"
#end

# configure irb
IRB.conf[:PROMPT_MODE] = :SIMPLE

# irb history
IRB.conf[:EVAL_HISTORY] = 10000
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

IRB.conf[:PROMPT][:DEFAULT] = {
  :PROMPT_I  =>  "\033[1;31mruby (#{RUBY_VERSION})\033[0;0m >\n",
  :PROMPT_S  =>  "\"> ",
  :PROMPT_C  =>  "\033[1;31mruby (#{RUBY_VERSION})\033[0;0m >\n",
  :RETURN    =>  "\033[0;37m%s\033[0;0m\n"
}

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

