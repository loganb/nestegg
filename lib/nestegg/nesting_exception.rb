module Nestegg
  module NestingException

    attr_reader :cause

    def initialize message = nil, cause = $!
      @cause = cause
      super(message ||= cause.message)
    end

    def set_backtrace bt
      if cause
        cause.backtrace.reverse.each do |line|
          if bt.last == line
            bt.pop
          else
            break
          end
        end
        bt << "cause: #{cause.class.name}: #{cause}"
        bt.concat cause.backtrace
      end
      super bt
    end

  end
end
