require 'pi_piper'
require 'qt1070'
require 'observer'


module Touchberrypi
	class Keyboard

		include PiPiper
    include Observable

		def initialize
			sensor = Qt1070::Qt1070.new "/dev/i2c-1"
			reset_change_signal
			watch :pin => 4, :pull => :up, :edge => :falling do
					 key_status = sensor.key_status
           changed
           notify_observers(self, miles)
			end
		end

    private
    def reset_change_signal
      sensor.detection_status
      sensor.key_status
    end

	end
end
