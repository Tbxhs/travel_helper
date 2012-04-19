class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :username
      t.string :connect
      t.string :password
      t.string :gonglue_url
      t.integer :user_id
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
