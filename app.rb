require 'sinatra'
require 'busgogo'
require 'json'

class Bus < Sinatra::Base
	
helpers do
	def get_profile(station)
        	scmachine = WebScraper.new
			bus_station=scmachine.busstation

			@profile_after={
 			'name' => station,
			'profiles' => []
			}

			name = params[:station]
			bus_station.profile(name)[0].each do |value|
			@profile_after['profiles'].push('sta' => value)
			end
 			@profile_after
        
	end
end

get '/api/v1/station/:station.json' do
content_type :json
get_profile(params[:station]).to_json


end

get '/' do
'Simplecadet api/v1 is up and working'
end

end

