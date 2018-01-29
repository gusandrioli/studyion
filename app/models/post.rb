class Post < ApplicationRecord
  belongs_to :user
  has_many :post_subjects
  has_many :subjects, through: :post_subjects

end
