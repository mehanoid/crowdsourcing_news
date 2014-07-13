class NewsCategoriesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def show
    respond_with(@news_category)
  end
end
