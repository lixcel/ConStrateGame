class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

mount_uploader :image, ImageUploader

has_many :posts, dependent: :destroy
has_many :comments
has_many :bookmarks, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :favorited_posts, through: :favorites, source: :post

# フォローをした、された
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
# 一覧画面用
has_many :followings, through: :relationships, source: :followed
has_many :followers, through: :reverse_of_relationships, source: :follower

# フォローした時
def follow(user_id)
  relationships.create(followed_id: user_id)
end

# フォローを外す時
def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
end

# フォローしているかの判定
def following?(user)
  followings.include?(user)
end

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
