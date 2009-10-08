require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Nestegg::NestingException do

  class TestNestingError < StandardError
    include Nestegg::NestingException
  end

  def create_cause(klass = StandardError, message = "cause msg", backtrace = ["line_one", "line_two"])
    e = klass.new(message)
    e.set_backtrace backtrace
    e
  end

  def with_exception exception
    begin
      raise exception
    rescue exception.class => e
      yield e
    end
  end

  it "includes cause in backtrace" do
    cause = create_cause(StandardError)
    with_exception TestNestingError.new("some message", cause) do |e|
      e.backtrace.should include("cause: StandardError: #{cause.message}")
    end
  end

  it "includes cause's backtrace after cause in backtrace" do
    cause = create_cause(StandardError)
    with_exception TestNestingError.new("some message", cause) do |e|
      e.backtrace[-3..-1].should == ["cause: StandardError: #{cause.message}", "line_one", "line_two"]
    end
  end

  it "removes duplicated backtrace elements from nesting exception" do
    cause_bt = caller.unshift "some_other_line"
    cause = create_cause(StandardError, "msg", cause_bt)
    begin
      line = __LINE__ + 1
      raise TestNestingError.new("msg", cause)
    rescue TestNestingError => e
      e.backtrace[0..1].should == ["#{__FILE__}:#{line}", "cause: StandardError: msg"]
    end
  end

  it "defaults cause to current raised exception ($!)" do
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
    raised_error.cause.should == expected_cause
  end

  it "uses passed message" do
    begin
      begin
        raise StandardError, 'STD MSG'
      rescue StandardError
        raise TestNestingError, 'NESTED MESSAGE'
      end
    rescue TestNestingError => e
      e.message.should == 'NESTED MESSAGE'
    end
  end

  it "defaults message to cause's message" do
    begin
      begin
        raise StandardError, 'STD MSG'
      rescue StandardError
        raise TestNestingError
      end
    rescue TestNestingError => e
      e.message.should == 'STD MSG'
    end
  end

end
