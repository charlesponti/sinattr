require 'twitter'
require 'oauth'
require 'oj'
require './config/twitter'

get('/sinattr') { @title = 'sinattr'; erb :sinattr }

#post('/post') {
#	Twitter.update(params[:tweet])
#  redirect '/sinattr'
#}

post('/sinattr') {
  @near = lat_long(params[:location])
  @radius = params[:radius]
  @tweets = Twitter.search(params[:what],
                   :geocode => "#{@near[0]},#{@near[1]},#{@radius}mi",
                   :result_type => "recent",
                   :count => 50)
  erb :sinattr
}
