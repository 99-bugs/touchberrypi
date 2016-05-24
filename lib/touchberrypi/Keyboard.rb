require 'pi_piper'
require 'qt1070'


module Touchberrypi
	class Keyboard

		include PiPiper
		include Qt1070

		KEY_MAP = ["LEFT","RIGHT","UP","DOWN","B","A","X"] 

		def initialize i2c
			sensor = Qt1070.new i2c

			# read sensor status to reset 'change' pin
			sensor.detection_status
			@previous_status = sensor.key_status

			this = self

			watch :pin => 4, :pull => :up, :trigger => :falling do
				detection = sensor.detection_status
				status = sensor.key_status
				
				this.call_block	status
			end
		end

		def on_key_change &block
			@on_key_change_block = block	
		end

		def on_key_up &block
			@on_key_up_block = block
		end

		def on_key_down &block
			@on_key_down_block = block
		end

		def call_block status
			status.length.times do |i|
				if status[i] != @previous_status[i]
					key = KEY_MAP[i]
					@on_key_up_block.call key if status[i] == "released" unless @on_key_up_block.nil?
					@on_key_down_block.call key if status[i] == "pressed" unless @on_key_down_block.nil?
					@on_key_change_block.call key, status[i] unless @on_key_change_block.nil?
				end
			end
			@previous_status = status
		end

	end
end
