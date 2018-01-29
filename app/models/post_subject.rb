class PostSubject < ApplicationRecord
  belongs_to :post
  belongs_to :subject
end
