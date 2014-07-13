require "rails_helper"

RSpec.describe NewsCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/news_categories/1").to route_to("news_categories#show", :id => "1")
    end

  end
end
