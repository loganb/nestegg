require 'rubygems'
require 'nestegg'

class ConfigurationError < StandardError
  include Nestegg::NestingException
end

def read_config_file
  File.open('missing_config_file') do |f|
    f.readlines
  end
end

def load_config
  begin
    lines = read_config_file
    # ... then use it to do stuff 
    # ... stuff that might fail for other reasons
  rescue
    raise ConfigurationError
  end
end

load_config
