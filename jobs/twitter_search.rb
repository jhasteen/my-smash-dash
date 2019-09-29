require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = '8hkJ0tullyCuiHaCAGus6AZwY'
  config.consumer_secret = 'Ub0X51tqtpLxgfG2eLC5pLgKNDd15UTzBy1eks42nBah9Fqggz'
  config.access_token = '1048044515305709568-CWLSrT3YFYD6geBKkDik8y3ILJa7Dm'
  config.access_token_secret = 'sLlZuC0nnCpUdh13qjJQjxcjU3oRswyg0KUP5rczUDkz5'
end

SCHEDULER.every '180s', :first_in => 0 do |job|
    begin
        searches = client.saved_searches()
        search = searches.last.query
        tweets = client.search(search+ ' -RT', { result_type: 'recent' }).take(10)
        tweets.map! do |tweet|

                result = { 
                  name: tweet.user.name, 
                  time: tweet.created_at.strftime("%d.%m.%Y %H:%M:%S"), 
                  body: tweet.text, 
                  avatar: tweet.user.profile_image_url_https.to_s
                }

                if tweet.media.size > 0
                    photomedia = tweet.media.select{|media| media.is_a? Twitter::Media::Photo }.first
                    result['img'] = photomedia.media_url_https.to_s + ":medium"
                end

                result
        end
        send_event('twitter_search', {
          comments: tweets, 
          title: search, 
          moreinfo: "Twitter-Search: #{search}"
        })
    rescue Twitter::Error
      puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
    end
end