class Generator
  attr_accessor :tweet_array

  def initialize(user, number_of_paragraphs)
    @tweet_array = Twitter.user_timeline(user, count: (number_of_paragraphs.to_i * 13))
    pull_tweets_from_tweet_array
    format_tweet
  end

  def pull_tweets_from_tweet_array
    @tweet_array = @tweet_array.map {|tweet| tweet[:text] }
  end

  def format_tweet
    @tweet_array.map! do |tweet|
      @tweet = tweet
      split_tweet_into_words #called first
      remove_character_from_word("@")
      remove_character_from_word("#")
      remove_retweet_announcements
      remove_urls
      capitalize_first_word_of_tweet
      convert_tweet_words_into_array #called last
    end
  end

  def split_tweet_into_words
    @tweet = @tweet.split(" ")
  end

  def remove_character_from_word(character)
    @tweet.map {|word| word[word.index(character)] = "" if word.include? character }
  end

  def remove_retweet_announcements
    @tweet.delete_if {|word| word.upcase == "RT"}
  end

  def remove_urls
    @tweet.delete_if {|word| word[0..3] == "http"}
  end

  def convert_tweet_words_into_array
    @tweet.join(" ")
  end

  def capitalize_first_word_of_tweet
    @tweet[0].capitalize! if @tweet[0].present?
  end

end
