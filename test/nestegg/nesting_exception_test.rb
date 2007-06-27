require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class NestingExceptionTest < Test::Unit::TestCase
  class TestNestingError < StandardError
    include Nestegg::NestingException
  end
  
  def create_cause(klass = StandardError, message = "cause msg", backtrace = ["line_one", "line_two"])
    begin
      raise klass, message, backtrace
    rescue klass => e
      return e
    end
  end
  
  def with_exception exception
    begin
      raise exception
    rescue exception.class => e
      yield e
    end
  end
  
  test "includes cause in backtrace" do
    cause = create_cause(StandardError)
    with_exception TestNestingError.new("some message", cause) do |e|
      assert_true e.backtrace.include?("cause: StandardError: #{cause.message}")
    end
  end
  
  test "includes cause and its backtrace in backtrace" do
    cause = create_cause(StandardError)
    with_exception TestNestingError.new("some message", cause) do |e|
      assert_equal ["cause: StandardError: #{cause.message}", "line_one", "line_two"], e.backtrace[-3..-1]
    end
  end
  
  test "removes duplicated backtrace elements from nesting exception" do
    cause_bt = caller.unshift "some_other_line"
    cause = create_cause(StandardError, "msg", cause_bt)
    begin
      raise TestNestingError.new("msg", cause)
    rescue TestNestingError => e
      assert_match(/#{__FILE__}:\d+:in `test_.+'$/, e.backtrace[0])
      assert_equal "cause: StandardError: msg", e.backtrace[1]
    end
  end
  
  test "cause defaults to current raised exception" do
    expected_cause = StandardError.new
    raised_error = nil
    begin
      begin
        raise expected_cause
      rescue
        raise TestNestingError
      end
    rescue TestNestingError => e
      raised_error = e
    end
    assert_equal expected_cause, raised_error.cause
  end
  
end
