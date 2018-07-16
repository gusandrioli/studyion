class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_subjects
  has_many :subjects, through: :post_subjects
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :body, presence: true, length: {minimum: 10, maximum: 2000}
  validates :user_id, presence: true
  mount_uploader :file, FileUploader

  

  def html_body
    self.body.split("\n").join("<br/>").html_safe
  end

end

