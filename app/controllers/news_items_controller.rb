class NewsItemsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def index
    @news_items = @news_items.confirmed
    category_id = params[:news_category_id]
    if category_id
      @news_category = NewsCategory.find category_id
      @news_items = @news_items.merge(@news_category.news_items)
    end
    respond_with(@news_items)
  end

  def show
    respond_with(@news_item)
  end

  def new
    respond_with(@news_item)
  end

  def edit
  end

  def create
    @news_item = NewsItem.new news_item_params.merge(user: current_user)
    @news_item.confirmed = true if current_user.admin?
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
    def news_item_params
      params.require(:news_item).permit(:title, :description, :body, category_ids: [])
    end
end
