require 'twitter'
require 'oauth'
require './config/twitter'

Twitter.configure do |config|
  config.consumer_key = 'JiGenoMMQZR0NDCaM3gCcw'
  config.consumer_secret = 'p5nd4l4UMrr0X1rsKlhyaiEB0h6vCE7ujM8MyZ7hY'
  config.oauth_token = '966006937-GScmtT3FKBbC5FL64B3p6VjIJieKXcxxLImjwcnY'
  config.oauth_token_secret = '9tei1DuM4UVvlMeDgRxEJUJxKZGJEJfZrXe5XrUJLI'
end

def prepare_access_token(oauth_token, oauth_token_secret)
  consumer = OAuth::Consumer.new("JiGenoMMQZR0NDCaM3gCcw", "p5nd4l4UMrr0X1rsKlhyaiEB0h6vCE7ujM8MyZ7hY",
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
access_token = prepare_access_token("966006937-GScmtT3FKBbC5FL64B3p6VjIJieKXcxxLImjwcnY", "9tei1DuM4UVvlMeDgRxEJUJxKZGJEJfZrXe5XrUJLI")

# use the access token as an agent to get the home timeline
response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
