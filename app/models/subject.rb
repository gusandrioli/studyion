class Subject < ApplicationRecord
  has_many :post_subjects
  has_many :posts, through: :post_subjects
  has_many :question_subjects
  has_many :questions, through: :question_subjects
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates_uniqueness_of :name

end