require 'sinatra'
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

			name = params[:station]
			scmachine.busstation.each do |value|
			profile_after['profiles'].push('sta' => value)
			end
 			profile_after
        
	end

	def get_data
        	scmachine = WebScraper.new
			

			profile_after={
 			'name' => station,
			'profiles' => []
			}

			
			scmachine.tmp_selectstation.each do |value|
			profile_after['profiles'].push('sta' => value)
			end
 			profile_after
        
	end

	def check_station(station,profiles)
		@check_station={}
		station.each do |sta|
			found= busgogo::WebScraper.tmp_selectstation.keys
			@check_station[sta] =\
			profiles.select{ |profile| !profiles_found.include? profile }

		end
	@check_station
	end




end

get '/api/v1/station/:station.json' do
	content_type :json
	get_profile(params[:station]).to_json
end


post '/api/v1/check' do
content_type :json
req=JSON.parse(request.body.read)
station = req['station']
profiles= req['profiles']
check_station(station, profiles).to_json



end


end

