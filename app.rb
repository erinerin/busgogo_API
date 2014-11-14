require 'sinatra/base'
require 'busgogo'
require 'json'
require './tutorial'

class Bus < Sinatra::Base

		configure :production, :development do
		enable :logging
		end

helpers do
	def get_profile(station)
        	scmachine = WebScraper.new


			profile_after={
 			'station' => station,
			'profiles' => []
			}

			scmachine.busstation.each do |value|
			profile_after['profiles'].push('station' => value)

			end
 			profile_after

	end
end

get '/api/v1/station/:station.json' do
	content_type :json
	get_profile(params[:station]).to_json
end

get '/' do
'ok'
end

  #get '/api/v1/tutorials' do
   # "Hello World"
  #end

post '/api/v1/tutorials' do
content_type :json
begin
req = JSON.parse(request.body.read)
logger.info req
rescue
halt 400
endTables:      0

tutorial = Tutorial.new
tutorial.num = req['num'].to_json
tutorial.station = req['station'].to_json
if tutorial.save
status 201
redirect "/api/v1/tutorials/#{tutorial.id}"
end
end



	get '/api/v1/tutorials/:id' do
	 	content_type :json, 'charset' => 'utf-8'

	  begin
		  @tutorial = Tutorial.find(params[:id])
			num = @tutorial.num
			station = @tutorial.station
			result = { num: num, station: station }.to_json
			logger.info("Found: #{result}")
			result
		rescue
			halt 400
		end
	end

end

