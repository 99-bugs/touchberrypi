$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchberrypi'

keyboard = Touchberrypi::Keyboard.new

keyboard.on_key_change do |key|
	puts "key changed: #{key}"
end

keyboard.on_key_up do |key|
	puts "key up: #{key}"
end

keyboard.on_key_down do |key|
	puts "key down: #{key}"
end

loop do
	sleep 0.01
end
