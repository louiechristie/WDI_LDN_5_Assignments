class Tweet 

  def self.send(message, params)
    consumer = OAuth::Consumer.new(ENV['NEMNEM_TWITTER_API_KEY'], ENV['NEMNEM_TWITTER_API_SECRET'], :site => "https://api.twitter.com")
    request_token = consumer.get_request_token(:oauth_callback => "http://localhost/twitter/auth_callback")

    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier] )
    token = access_token.token
    secret = access_token.secret

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['NEMNEM_TWITTER_API_KEY']
      config.consumer_secret     = ENV['NEMNEM_TWITTER_API_SECRET']
      config.access_token        = token
      config.access_token_secret = secret
    end

    client.update(message)  
  end
end