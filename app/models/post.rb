class Post < ApplicationRecord

  enum kind:{
    strategy: 0,
    consideration: 1,
  }

end
