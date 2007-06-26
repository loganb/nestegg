require 'test/unit'
require File.dirname(__FILE__) + '/../lib/nestegg'

Test::Unit::TestCase.class_eval do
  def self.test name, &block
    define_method "test_#{name.gsub(/\s/, '_')}", &block
  end
  
  def assert_true expression
    assert_equal true, expression
  end
end