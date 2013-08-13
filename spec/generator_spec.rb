require 'spec_helper'

describe Generator do
  context "upon initialization" do
    it "generates a tweet array" do
      g = Generator.new("gem", 3)
      expect(g.tweet_array.length).to eq(3*13)
    end
  end

  context "when altering an array of tweets" do
    before :each do
      @tweet_array = Generator.stub(:new).with(@user, '10').and_return([tweet_array])
    end
  end
end
