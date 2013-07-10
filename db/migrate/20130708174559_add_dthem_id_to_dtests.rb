class AddDthemIdToDtests < ActiveRecord::Migration
  def change
    add_column :dtests, :dthem_id, :integer
  end
end
