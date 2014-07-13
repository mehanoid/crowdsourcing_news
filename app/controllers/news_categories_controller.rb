class NewsCategoriesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create
  # before_action :set_news_category, only: [:show, :edit, :update, :destroy]

  def index
    # @news_categories = NewsCategory.all
    respond_with(@news_categories)
  end

  def show
    respond_with(@news_category)
  end
end
