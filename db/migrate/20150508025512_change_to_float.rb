class ChangeToFloat < ActiveRecord::Migration
  def change
change_column :meetups, :lat,  :float
change_column :meetups, :long,  :float
  end
end
