class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.text :body, null: false
      t.float :rate
      t.integer :user_id
      t.integer :tag_id


      t.timestamps
    end
  end
end
