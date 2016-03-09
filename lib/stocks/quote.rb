require 'stocks/instrument'

module Stocks
	class Quote
		attr_reader :instrument
		attr_reader :price
		attr_reader :date_time
		attr_reader :high
		attr_reader :low

		def initialize(instrument, price, date_time = DateTime.now, high, low)
			@instrument = instrument
			@price = price
			@date_time = date_time
			@high = high
			@low = low
		end
	end
end

