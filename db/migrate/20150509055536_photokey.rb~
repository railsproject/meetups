class Photokey < ActiveRecord::Migration
  def change
change_table :photos do |t|
      t.references :meetup, index: true, foreign_key: true
      
    end
  end
end
