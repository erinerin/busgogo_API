require 'sinatra/base'
require 'sinatra/namespace'
require 'busgogo'
require 'json'

class Bus < sinatra::base
	register sinatra::namespace


helpers do
	def station
		budges_after = {
			'station' => station
		}
	end
end


end

