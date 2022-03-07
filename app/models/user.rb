class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

mount_uploader :image, ImageUploader

has_many :posts

end
