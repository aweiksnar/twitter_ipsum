class GeneratorsController < ApplicationController

  def home
  end

  def parse
    @list_of_tweets = Generator.new(params[:twitter_handle], params[:number_of_paragraphs]).loop_through_tweets

    render "home"
  end

end
