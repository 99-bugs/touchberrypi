$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchberrypi'

i2c = I2C.create '/dev/i2c-1'

keyboard = Touchberrypi::Keyboard.new i2c
leds = Touchberrypi::Leds.new i2c

keyboard.on_key_change do |status|
	puts "key changed #{status}"
end

loop do
	sleep 0.01
end
