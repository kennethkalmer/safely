module Safely
  module Mixin

    def safely
      Safely.load_strategies!

      begin
        yield
      rescue => e
        Safely.error(e)
      end
    end

  end
end
