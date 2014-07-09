require 'rails_helper'

RSpec.describe "news_items/show", :type => :view do
  before(:each) do
    @news_item = assign(:news_item, NewsItem.create!(
      :title => "Title",
      :description => "Description",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
