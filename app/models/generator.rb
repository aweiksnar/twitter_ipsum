class Generator

  def initialize(user, number_of_tweets)
    @tweet_array = Twitter.user_timeline(user, count: number_of_tweets)
  end

  def loop_through_tweets
    paragraph = ""
    @tweet_array.each do |tweet|
      paragraph << tweet[:text]
    end
    paragraph
  end

end
