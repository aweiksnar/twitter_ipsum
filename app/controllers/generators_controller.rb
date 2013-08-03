class GeneratorsController < ApplicationController

  def home
  end

  def parse
    @list_of_tweets = Generator.new(params[:twitter_handle], params[:number_of_paragraphs]).tweet_array
    render "home"
  end

end
