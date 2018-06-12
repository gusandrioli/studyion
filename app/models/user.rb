class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                      length: {maximum: 105},
                      uniqueness: {case_sensitive: false},
                      format: { with: VALID_EMAIL_REGEX}
  has_many :posts
  has_many :questions
  has_many :tasks
  has_many :comments
  has_many :assignments
  has_many :roles, through: :assignments     
  mount_uploader :picture, PictureUploader
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :picture, presence: true

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
  
end
