class Generator
  attr_accessor :tweet_array

  def initialize(user, number_of_tweets)
    @tweet_array = Twitter.user_timeline(user, count: number_of_tweets)
    pull_tweets_from_tweet_array
    format_tweet
  end

  def pull_tweets_from_tweet_array
    @tweet_array = @tweet_array.map {|tweet| tweet[:text] }
  end

  def format_tweet
    @tweet_array.map! do |tweet|
      tweet = tweet.split(" ")
      tweet.map {|word| word[0] = "" if word[0] == "#" || word[0] == "@" }
      tweet.delete_if {|word| word.upcase == "RT"}
      tweet.delete_if {|word| word[0..3] == "http"}
      tweet.join(" ")
    end
  end

end
