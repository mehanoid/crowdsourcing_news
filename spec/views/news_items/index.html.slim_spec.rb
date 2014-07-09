require 'rails_helper'

RSpec.describe "news_items/index", :type => :view do
  before(:each) do
    assign(:news_items, [
      NewsItem.create!(
        :title => "Title",
        :description => "Description",
        :body => "MyText",
        :user => nil
      ),
      NewsItem.create!(
        :title => "Title",
        :description => "Description",
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of news_items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
