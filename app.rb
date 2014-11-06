
require 'sinatra/base'
require 'bundler'
require 'sinatra/namespace'
require 'logger'
require 'busgogo'
require 'json'


class Bus < Sinatra::Sase
	register Sinatra::Namespace

helpers do
	def station
		budges_after = {
			'station' => station
		}
	end
end
end

