class CreateTagmeetups < ActiveRecord::Migration
  def change
    create_table :tagmeetups do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :meetup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
