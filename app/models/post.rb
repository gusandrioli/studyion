class Post < ApplicationRecord
  belongs_to :user
  has_many :post_subjects
  has_many :subjects, through: :post_subjects
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :body, presence: true, length: {minimum: 10, maximum: 1000}
  validates :user_id, presence: true
end

