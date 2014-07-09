class NewsItem < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :body, :user, presence: true
end
