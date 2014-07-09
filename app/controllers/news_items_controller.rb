class NewsItemsController < ApplicationController
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  def index
    @news_items = NewsItem.all
    respond_with(@news_items)
  end

  def show
    respond_with(@news_item)
  end

  def new
    @news_item = NewsItem.new
    respond_with(@news_item)
  end

  def edit
  end

  def create
    @news_item = NewsItem.new news_item_params.merge(user: current_user)
    @news_item.save
    respond_with(@news_item)
  end

  def update
    @news_item.update(news_item_params)
    respond_with(@news_item)
  end

  def destroy
    @news_item.destroy
    respond_with(@news_item)
  end

  private
    def set_news_item
      @news_item = NewsItem.find(params[:id])
    end

    def news_item_params
      params.require(:news_item).permit(:title, :description, :body)
    end
end
