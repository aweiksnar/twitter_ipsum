require 'spec_helper'

describe Generator do
  context "upon initialization" do
    it "generates a tweet array" do
      g = Generator.new("gem", 3)
      expect(g.tweet_array.length).to eq(3*13)
    end
  end
end
