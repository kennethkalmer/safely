module Safely
  class Config

    # List of strategies to use
    attr_writer :strategies

    def strategies
      @strategies ||= [
        Safely::Strategy::Hoptoad,
        Safely::Strategy::Mail,
        Safely::Strategy::Log
      ]
    end

    def hoptoad_key
      $stderr.write "DEPRECATED: Call Safely::Strategy::Hoptoad.hoptoad_key"
      Safely::Strategy::Hoptoad.hoptoad_key
    end

    def hoptoad_key=( key )
      $stderr.write "DEPRECATED: Call Safely::Strategy::Hoptoad.hoptoad_key="
      Safely::Strategy::Hoptoad.hoptoad_key=( key )
    end
  end
end
