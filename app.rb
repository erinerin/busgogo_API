require 'sinatra/base'
#require 'busgogo'
require 'json'

class Bus < Sinatra::Base
	
# helpers do
# 	def get_profile(station)
#         	scmachine = WebScraper.new
			

# 			@profile_after={
#  			'name' => station,
# 			'profiles' => []
# 			}

# 			scmachine.busstation.each do |value|
# 			profile_after['profiles'].push('sta' => value)

# 			end
#  			@profile_after
        
# 	end
# end

get '/api/v1/station/:station.json' do
	content_type :json
	get_profile(params[:station]).to_json
end

get '/' do
'ok'
end

end
