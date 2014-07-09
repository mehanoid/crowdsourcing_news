require 'rails_helper'

RSpec.describe "news_items/new", :type => :view do
  before(:each) do
    assign(:news_item, NewsItem.new(
      :title => "MyString",
      :description => "MyString",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new news_item form" do
    render

    assert_select "form[action=?][method=?]", news_items_path, "post" do

      assert_select "input#news_item_title[name=?]", "news_item[title]"

      assert_select "input#news_item_description[name=?]", "news_item[description]"

      assert_select "textarea#news_item_body[name=?]", "news_item[body]"

      assert_select "input#news_item_user_id[name=?]", "news_item[user_id]"
    end
  end
end
