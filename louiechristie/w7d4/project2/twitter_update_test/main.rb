require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['NEMNEM_TWITTER_API_KEY']
  config.consumer_secret     = ENV['NEMNEM_TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end

client.update_with_media("Hello from my ruby app!", File.new("./like.jpg"))