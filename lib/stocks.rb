require 'pp'

require 'stocks/version'
require 'stocks/quotes_provider'
require 'stocks/instrument'
require 'stocks/position'
require 'stocks/quote'

module Stocks
	class Stocks
		def initialize
			#
		end
		
		def run
			puts "Getting quotes for [AAPL]..."
			Instrument.get('AAPL').replay(Date.new(2013, 1, 1), Date.new(2016, 1, 1)) do |quote|
				puts "#{quote.instrument.symbol}: #{quote.price} [High: #{quote.high}] [Low: #{quote.low}]"
			end
		end
	end
end
