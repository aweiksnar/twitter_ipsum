class GeneratorsController < ApplicationController

  def home
  end

  def parse
    if Twitter.user?(params[:twitter_handle])
      @list_of_tweets = Generator.new(params[:twitter_handle], params[:number_of_paragraphs]).tweet_array
      render "home"
    else
      redirect_to generator_url, notice: "That is not a valid username"
    end
  end

end
