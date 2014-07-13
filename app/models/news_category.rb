class NewsCategory < ActiveRecord::Base
  validates :name, presence: true
end
