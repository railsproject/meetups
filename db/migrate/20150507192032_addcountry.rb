class Addcountry < ActiveRecord::Migration
  def change
 add_column :meetups, :country, :string
  end
end
