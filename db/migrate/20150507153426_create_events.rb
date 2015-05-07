class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.references :meetup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
