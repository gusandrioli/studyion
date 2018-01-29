class Subject < ApplicationRecord
  has_many :post_subjects
  has_many :posts, through: :post_subjects

end