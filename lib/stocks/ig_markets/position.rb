require 'ig_markets'

module IGMarkets
	class Position < Model
		def info
			info = "Position\n"
			info = info + "==================================\n"
			info = info + "Market: #{self.market.instrument_name}\n"
			info = info + "Direction: #{self.direction}\n"
			info = info + "Contract Size: #{self.contract_size}\n"
			info = info + "Controlled Risk: #{self.controlled_risk}\n"
			info = info + "Created Date: #{self.created_date}\n"
			info = info + "Created Date (UTC): #{self.created_date_utc}\n"
			info = info + "Currency: #{self.currency}\n"
			info = info + "Deal ID: #{self.deal_id}\n"
			info = info + "Level: #{self.level}\n"
			info = info + "Limit Level: #{self.limit_level}\n"
			info = info + "Stop Level: #{self.stop_level}\n"
			info = info + "Trailing Step: #{self.trailing_step}\n"
			info = info + "Trailing Stop: #{self.trailing_stop?}\n"
			info = info + "Trailing Stop Distance: #{self.trailing_stop_distance}\n"
			info = info + "Size: #{self.size}\n"
			return info
		end
	end
end

