class CreatePlanDetails < ActiveRecord::Migration
  def change
    create_table :plan_details do |t|
      t.string :plan_type
      t.string :from_city
      t.string :to_city
      t.datetime :go_time
      t.datetime :arrive_time
      t.decimal :price, :precision => 10, :scale => 2
      t.string :hotel_name
      t.string :note
      t.text :zoufa
      t.integer :plan_id

      t.timestamps
    end
  end
end
