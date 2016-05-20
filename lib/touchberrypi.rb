require "touchberrypi/version"

require 'pi_piper'
require 'qt1070'

module Touchberrypi

	class Controller

		include PiPiper

		def initialize

			sensor = Qt1070::Qt1070.new "/dev/i2c-1"

			sensor.key_status

			watch :pin => 4, :pull => :up, :edge => :falling do
				begin
				#	puts sensor.inspect
				#	puts "QT1070 state: #{sensor.key_status}"  
				#	puts "Pin changed from #{last_value} to #{value}"
					 sensor.detection_status
				#	sleep 0.5
				puts	 sensor.key_status.inspect
#					puts "hello"
				rescue => e
					puts e
				end
			end

			loop do
#				sensor.key_status
				sleep 0.01
			end

		end

		#Or
		#
		#after :pin => 23, :goes => :high do
		#  puts "Button pressed"
		#  end
		#
		#  PiPiper.wait

	end

end

