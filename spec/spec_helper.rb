require 'rubygems'
require 'spec'

#Replaced this `require` with `$LOAD_PATH.unshift`
#to ensure the file is used instead of the gem.
#lib/nestegg.rb was loading nestegg/version from the gem
#instead of lib/nestegg/version.rb
#require File.dirname(__FILE__) + '/../lib/nestegg'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))
require 'nestegg'
