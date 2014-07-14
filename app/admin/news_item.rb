ActiveAdmin.register NewsItem do

  actions :all, except: [:new, :create, :edit, :update]

  action_item only: :show, if: -> { !resource.confirmed? } do
    link_to 'Сonfirm', confirm_admin_news_item_path(resource), method: :patch
  end

  member_action :confirm, method: :patch do
    resource.confirm!
    redirect_to resource_path, notice: 'Confirmed'
  end

  # controller do
  #   def create
  #     @news_item = NewsItem.new permitted_params[:news_item]
  #
  #     if @post.save
  #     end
  #   end
  # end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :title, :description, :body
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
