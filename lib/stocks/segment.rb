require 'stocks/instrument'

module Stocks
	class Segment
		attr_reader :instrument
		attr_reader :from
		attr_reader :to
		attr_reader :high
		attr_reader :low
		attr_reader :open
		attr_reader :close

		def initialize(instrument, from, to, high, low, open, close)
			@instrument = instrument
			@from = from
			@to = to
			@high = high
			@low = low
			@open = open
			@close = close
		end

		def scale
			return to - from
		end
	end
end

