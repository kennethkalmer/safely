module Safely
  module Mixin

    def safely
      Safely.load_strategies!

      begin
        yield
      rescue => e
        Safely.report!( e )
      end
    end

  end
end
