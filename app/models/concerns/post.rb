class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
