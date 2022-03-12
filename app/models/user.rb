class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

mount_uploader :image, ImageUploader

has_many :posts

  # 検索分岐
  def self.looks(search, word)
    if search == "forward_match"
      @user = User.where("nickname LIKE?","#{word}%")
    elsif search == "partial_match"
      @user = User.where("nickname LIKE?","%#{word}%")
    else
      @user = User.page(params[:page]).per(10)
    end
  end

end
