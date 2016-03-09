require 'net/http'

module Lightstreamer
	class Client
		attr_reader :base_url
		attr_reader :adapter_set
		attr_reader :user
		attr_reader :password
		
		def initialize(base_url, adapter_set, user, password)
			@stream_connection = nil
			@control_connection = nil
			@session = {}
			
			@base_url = base_url
			@adapter_set = adapter_set
			@user = user
			@password = password
		end
		
		def connect
			self.connect_stream
			self.connect_control
		end
		
		def disconnect
			if @stream_connection.started?
				@stream_connection.finish
			end
			if @control_connection.started?
				@control_connection.finish
			end
		end
		
		def subscribe(subscription_key)
			#
		end
		
		def unsubscribe(subscription_key)
			#
		end
		
		private
		
		def connect_stream
			if !@stream_connection.started? then
				uri = URI::join(@base_url, '/lightstreamer/create_session.txt')
				Net::HTTP.start(uri.host, uri.port) do |http|
					@stream_connection = http
					
					request = Net::HTTP::Post.new(uri)
					request.set_form_data(
						'LS_op2' => 'create',
						'LS_cid' => 'mgQkwtwdysogQz2BJ4Ji%20kOj2Bg',
						'LS_user' => @user,
						'LS_password' => @password,
						'LS_adapter_set' => @adapter_set
					)
					http.request request do |response|
						buffer = LineBuffer.new
						response.read_body do |chunk|
							buffer.process chunk do |line|
								# debug
								puts line
								handle_stream(line)
							end
						end
					end
				end
			else
				raise "Stream connection already started!"
			end
		end
		
		def connect_control
			if !@stream_connection.started? then
				#
			else
				raise "Control connection already started!"
			end
		end
		
		def handle_stream(line)
			if line == "OK" then
				values = line.split(":")
				@session[values[0]] = values[1]
			end
			
			
		end
		
		def control_link_url
			if @session.key?("ControlAddress") && @session["ControlAddress"] != nil then
				return URI::join(@base_url, @session["ControlAddress"])
			else
				return URI(@base_url)
			end	
		end
	end
	
	class LineBuffer
		attr_reader :buffer
		
		def initialize()
			@buffer = ""
		end
		
		def process(data)
			@buffer << data
			lines = @buffer.split("\n")
			if !@buffer.ends_with? "\n" then
				@buffer = lines.pop
			else
				@buffer = ""
			end
			lines.each do |line|
				yield line
			end
		end
	end
end
