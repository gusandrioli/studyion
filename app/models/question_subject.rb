class QuestionSubject < ApplicationRecord
  belongs_to :question
  belongs_to :subject
end
