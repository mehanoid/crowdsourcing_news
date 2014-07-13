require "rails_helper"

RSpec.describe NewsCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news_categories").to route_to("news_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/news_categories/new").to route_to("news_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/news_categories/1").to route_to("news_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news_categories/1/edit").to route_to("news_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news_categories").to route_to("news_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/news_categories/1").to route_to("news_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news_categories/1").to route_to("news_categories#destroy", :id => "1")
    end

  end
end
