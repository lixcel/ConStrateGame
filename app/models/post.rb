class Post < ApplicationRecord

  belongs_to :user
  mount_uploader :image, ImageUploader


  enum kind:{
    strategy: 0,
    consideration: 1,
  }

end
