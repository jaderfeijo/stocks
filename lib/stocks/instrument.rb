module Stocks
	class Instrument
		attr_reader :symbol
		attr_reader :name

		def initialize(symbol, name)
			@symbol = symbol
			@name = name
		end
	end
end
