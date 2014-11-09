require 'sinatra/base'
require 'busgogo'
require 'json'

class Bus < Sinatra::Base
	
helpers do
	def get_profile(station)
        	scmachine = WebScraper.new
			

			profile_after={
 			'name' => station,
			'profiles' => []
			}

<<<<<<< HEAD
			scmachine.busstation.each do |value|
			profile_after['profiles'].push('sta' => value)
=======
			name = params[:station]
			scmachine.busstation.each do |value|
			profile_after['profiles'].push('sta' => value)
			bus_station.profile(name)[0].each do |value|
			@profile_after['profiles'].push('sta' => value)
			end
 			@profile_after
        
	end

	def get_data
        	scmachine = WebScraper.new
			
>>>>>>> 5c73b025b8512231569b2ca60e8379905fa269bc

			end
 			profile_after
        
	end
end

get '/api/v1/station/:station.json' do
	content_type :json
	get_profile(params[:station]).to_json
end

<<<<<<< HEAD
get '/' do
'ok'
end
=======

post '/api/v1/check' do
content_type :json
req=JSON.parse(request.body.read)
station = req['station']
profiles= req['profiles']
check_station(station, profiles).to_json



end


>>>>>>> 5c73b025b8512231569b2ca60e8379905fa269bc

end
