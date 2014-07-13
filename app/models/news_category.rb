class NewsCategory < ActiveRecord::Base
  has_and_belongs_to_many :news_items
  validates :name, presence: true

  def to_s
    name
  end
end
