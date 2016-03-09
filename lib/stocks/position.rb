require 'stocks/instrument'

module Stocks
	class Position
		attr_reader :instrument
		attr_reader :opening_price

		def initialize(instrument, opening_price)
			@instrument = instrument
			@opening_price = opening_price
		end

		def value
			raise NotImplementedError
		end
	end
end

