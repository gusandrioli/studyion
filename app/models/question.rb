class Question < ApplicationRecord
  belongs_to :user
  has_many :question_subjects
  has_many :subjects, through: :question_subjects

end
