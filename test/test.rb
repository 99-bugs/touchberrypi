$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchberrypi'

include Touchberrypi

i2c = I2C.create '/dev/i2c-1'

keyboard = Touchberrypi::Keyboard.new i2c
leds = Touchberrypi::Leds.new i2c

keyboard.on_key_change do |key, status|
	puts "key #{key} changed #{status}"

	if status == "pressed"
		case key
		when "LEFT"
			leds.set_led 0, Color::RGB::Blue
		when "RIGHT"
			leds.set_led 1, Color::RGB::Red
		when "UP"
			leds.set_led 2, Color::RGB::Green
		when "DOWN"
			leds.set_led 3, Color::RGB::Yellow
		when "A"
			leds.set_led 4, Color::RGB::Cyan
		end

	else 
		leds.clear_all
	end
		
end

loop do
	sleep 0.01
end


leds.clear_all

#leds.set_color 0,RGB:: BLUE
