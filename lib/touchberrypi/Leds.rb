require 'tlc59116'
require 'color'

module Touchberrypi

	include Tlc59116
	#include Color

	class Leds
		def initialize i2c
			@driver = Tlc59116::Tlc59116.new i2c
			@driver.enable

			#enable individual control and group dimming
			@driver.pwm_control 0xFF, 0xFF, 0xFF, 0xFF

			@driver.group_brightness 0x10

			clear_all
		end

		def set_led ledindex, color
			@driver.pwm color.green.to_i, color.red.to_i, color.blue.to_i, offset: ledindex * 3
		end

		def clear_all
			5.times do |i|
				set_led i, Color::RGB::Black
			end
		end

  end

end

