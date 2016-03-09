require 'ig_markets'

module IGMarkets
	class MarketOverview
		def info
			info = "MarketOverview\n"
			info = info + "==================================\n"
			info = info + "Instrument Name: #{self.instrument_name}\n"
			info = info + "EPIC: #{self.epic}\n"
			info = info + "Type: #{self.instrument_type}\n"
			info = info + "Bid: #{self.bid}\n"
			info = info + "Offer: #{self.offer}\n"
			info = info + "High: #{self.high}\n"
			info = info + "Low: #{self.low}\n"
			info = info + "Net Change: #{self.net_change}\n"
			info = info + "Percentage Change: #{self.percentage_change}\n"
		end
	end
end
