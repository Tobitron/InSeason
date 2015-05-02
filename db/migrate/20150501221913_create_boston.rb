class CreateBoston < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name, null: false
      t.integer :start_day, null: false
      t.integer :end_day, null: false
      t.boolean :winter_vegetable, default: false
    end
  end
end
