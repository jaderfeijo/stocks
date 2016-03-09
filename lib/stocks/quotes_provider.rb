require 'stock_quote'
require 'pp'

require 'stocks/instrument'

module Stocks
	class QuotesProvider
		def self.get_quote(instrument)
			stock = StockQuote::Stock.quote(instrument.symbol)
			quote = Quote.from_stock(stock)
			return quote
		end

		def self.get_quotes(instrument, start_date, end_date)
			quotes = Array.new
			StockQuote::Stock.history(instrument.symbol, start_date, end_date).each do |stock_quote|
				quotes << Quote.from_stock_quote(stock_quote)
			end
			return quotes
		end

		def self.on_market_movement(instrument, &block)
			last_quote = nil
			loop do
				quote = self.get_quote(instrument)
				if block != nil then
					if (last_quote != nil && quote.price != last_quote.price) || last_quote == nil then
						block.call(quote)
					end
				end
				last_quote = quote
			end
		end

		def self.replay(instrument, start_date, end_date, &block)
			if block != nil then
				self.get_quotes(instrument, start_date, end_date).each do |quote|
					block.call(quote)
				end
			end
		end
	end

	class Quote
		def self.from_stock(stock)
			return Quote.new(Instrument.new(stock.symbol, stock.name), stock.last_trade_price_only)
		end

		def self.from_stock_quote(stock_quote)
			return Quote.new(Instrument.get(
				stock_quote.symbol.tr("'", "")),
				stock_quote.close, 
				DateTime.parse(stock_quote.date.to_s),
				stock_quote.high,
				stock_quote.low
			)
		end
	end

	class Instrument
		@@instruments = Array.new

		def self.get(symbol)
			instrument = @@instruments.find {|i| i.symbol == symbol}
			if instrument == nil then
				stock = StockQuote::Stock.quote(symbol)
				if stock != nil then
					instrument = Instrument.new(stock.symbol, stock.name)
					if instrument != nil then
						@@instruments << instrument
					end
				end
			end
			return instrument
		end

		def get_quote
			return QuotesProvider.get_quote(self)
		end

		def on_market_movement(&block)
			QuotesProvider.on_market_movement(self, &block)
		end

		def replay(start_date, end_date, &block)
			QuotesProvider.replay(self, start_date, end_date, &block)
		end
	end
end

