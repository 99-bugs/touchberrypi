require 'pi_piper'
require 'qt1070'


module Touchberrypi
	class Keyboard

		include PiPiper
		include Qt1070

		KEY_MAP = ["LEFT","RIGHT","UP","DOWN","B","A","X"] 

		def initialize
			sensor = Qt1070.new "/dev/i2c-1"

			# read sensor status to reset 'change' pin
			sensor.detection_status
			sensor.key_status

			this = self

			watch :pin => 4, :pull => :up, :trigger => :falling do
				detection = sensor.detection_status
				status = sensor.key_status
				
				this.call_block	status
			end
		end

		def on_change &block
			@block = block	
		end

		def call_block status
			puts @block.inspect
			@block.call status unless @block.nil?
		end

	end
end
