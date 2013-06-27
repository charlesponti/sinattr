require 'twitter'
require 'oauth'
require './config/twitter'

Twitter.configure do |config|
  config.consumer_key = 'YOUR_CONSUMER_KEY'
  config.oauth_token = 'YOUR_OAUTH_TOKEN'
  config.oauth_token = "YOUR_OAUTH_TOKEN"
  config.oauth_token_secret = 'YOUR_OAUTH_SECRET'
end

def prepare_access_token(oauth_token, oauth_token_secret)
  consumer = OAuth::Consumer.new("YOUR_CONSUMER_KEY", "YOUR_CONSUMER_SECRET",
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => oauth_token,
                 :oauth_token_secret => oauth_token_secret
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end

# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token("YOUR_OAUTH_TOKEN", "YOUR_OAUTH_SECRET")

# use the access token as an agent to get the home timeline
response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
