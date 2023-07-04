class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id           , null: false, foreign_key: true
      t.integer :prototype_id      , null: false, foreign_key: true
      t.string  :content           , null: false
      t.timestamps
    end
  end
end
