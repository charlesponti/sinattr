require 'sinatra'
require 'sinatra/contrib/all'
require 'geocoder'

require './helpers/apphelpers'

get('/') { @title = 'Home'; erb :'static/home' }
  
get('/about') { @title = 'About'; erb :'static/about' }

not_found { @title = '404'; erb :'static/not_found' }


# Controllers
Dir.glob('./controllers/*.rb').each { |file| require file }