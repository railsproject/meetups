class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :disc
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
