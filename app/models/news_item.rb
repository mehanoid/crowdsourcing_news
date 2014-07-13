class NewsItem < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories, class_name: 'NewsCategory'
  validates :title, :description, :body, :user, presence: true
  validates :categories, length: { minimum: 1, message: 'should have at least one category' }

  default_scope { order created_at: :desc }

  def to_s
    title
  end
end
