$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchberrypi'
require 'socket'

include Touchberrypi

i2c = I2C.create '/dev/i2c-1'

keyboard = Touchberrypi::Keyboard.new i2c
leds = Touchberrypi::Leds.new i2c

client = TCPSocket.open("localhost", 9957)

def robot_move direction
	client.puts '[{"id": "robot1", "move": "'+ direction +'"}]'
	
end

def robot_shoot 
	gun = "rocket"
	client.puts '[{"id": "robot1", "shoot": "'+ gun +'"}]'

end

keyboard.on_key_change do |key, status|
	puts "key #{key} changed #{status}"

	if status == "pressed"
		case key
		when "LEFT"
			leds.set_led 0, Color::RGB::Blue
			robot_move "left"
		when "RIGHT"
			leds.set_led 1, Color::RGB::Red
			robot_move "right"
		when "UP"
			leds.set_led 2, Color::RGB::Green
			robot_move "forward"
		when "DOWN"
			leds.set_led 3, Color::RGB::Yellow
			robot_move "reverse"
		when "A"
			leds.set_led 4, Color::RGB::Cyan
			robot_shoot
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
