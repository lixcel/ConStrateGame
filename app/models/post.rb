class Post < ApplicationRecord

  belongs_to :user
  mount_uploader :image, ImageUploader


  enum kind:{
    攻略: 0,
    考察: 1,
  }

end
