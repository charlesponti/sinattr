require 'twitter'
require 'oauth'
require './config/twitter'

get('/sinattr') { @title = 'sinattr'; erb :sinattr }

#post('/post') {
#	Twitter.update(params[:tweet])
#  redirect '/sinattr'
#}

post('/sinattr') { 
  @tweets = Twitter.search(params[:what], :count => 10000)
  @location = params[:location]
  @results = []
  @tweets.results.map do |tweet|
  	if get_distance(lat_long(tweet.user.location), @location) < 250
  		@results << tweet
  	end
  end
  erb :sinattr
}
