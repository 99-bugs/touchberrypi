$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchberrypi'

keyboard = Touchberrypi::Keyboard.new
keyboard.on_change do |status|
	puts "key changed #{status}"
end

loop do
	sleep 0.01
end
