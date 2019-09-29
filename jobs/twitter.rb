require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = '8hkJ0tullyCuiHaCAGus6AZwY'
  config.consumer_secret = 'Ub0X51tqtpLxgfG2eLC5pLgKNDd15UTzBy1eks42nBah9Fqggz'
  config.access_token = '1048044515305709568-CWLSrT3YFYD6geBKkDik8y3ILJa7Dm'
  config.access_token_secret = 'sLlZuC0nnCpUdh13qjJQjxcjU3oRswyg0KUP5rczUDkz5'
end

search_term = URI::encode('#todayilearned')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end