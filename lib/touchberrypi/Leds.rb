require "tlc59116"
require "color"

module Touchberrypi

	include Tlc59116

	class Leds
		def initialize i2c
			@driver = Tlc59116.new i2c
			@driver.enable

			clear
		end

		def set_color ledindex, color

		end

		def clear
			5.times do |i|
				set_color i, Color::RGB::Black
			end
		end

  end

end
