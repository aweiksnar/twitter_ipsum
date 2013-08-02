class Generator
  attr_accessor :tweet_array

  def initialize(user, number_of_tweets)
    @tweet_array = Twitter.user_timeline(user, count: number_of_tweets)
    pull_tweets_from_tweet_array
  end

  # def loop_through_tweets
  #   paragraph = ""
  #   @tweet_array.each do |tweet|
  #     paragraph << tweet[:text]
  #   end
  #   paragraph
  # end

  def pull_tweets_from_tweet_array
    @tweet_array = @tweet_array.map {|tweet| tweet[:text] }
  end
end
