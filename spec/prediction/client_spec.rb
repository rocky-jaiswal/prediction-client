require_relative '../spec_helper'

describe Prediction::Client do
  describe "Client" do

    it "should parse users csv properly" do
      #puts Prediction::Client.seed_user_data()
    end

    it "should parse books csv properly" do
      #puts Prediction::Client.seed_book_data()
    end

    it "should parse ratings csv properly" do
      #puts Prediction::Client.seed_ratings()
    end

    it "should get a user properly" do
      puts Prediction::Client.get_user(5).inspect
    end

    it "should get recommendations for a user" do
      puts Prediction::Client.get_recommendations_for_user(5).inspect
    end

  end
end