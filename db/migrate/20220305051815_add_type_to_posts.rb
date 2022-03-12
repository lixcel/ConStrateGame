class AddTypeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :kind, :integer, default: 0
  end
end
