class Post < ApplicationRecord

  belongs_to :user

  enum kind:{
    strategy: 0,
    consideration: 1,
  }

end
