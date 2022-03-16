class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # 並び替え用
  scope :latest, -> {order(updated_at: :desc)}
  scope :old, -> {order(updated_at: :asc)}

  enum kind:{
    攻略: 0,
    考察: 1,
  }


  def save_tag(sent_tags)
    # 元からあるタグならば、配列として取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  # 検索分岐
  def self.looks(search, word)
    if search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.page(params[:page]).per(10)
    end
  end

# 既にブックマークをしているかの確認
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
