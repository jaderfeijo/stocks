module Lightstreamer
	class Subscription
		attr_reader :mode
		attr_reader :items
		attr_reader :fields
		attr_reader :adapter
		
		def initialize(mode, items, fields, adapter)
			@mode = mode
			@items = items
			@fields = fields
			@adapter = adapter
		end
		
		def add_listener(listener)
			#
		end
		
		def notify_update(item_line)
			#
		end
	end
end
