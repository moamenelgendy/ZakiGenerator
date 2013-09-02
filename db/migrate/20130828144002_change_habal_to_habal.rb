class ChangeHabalToHabal < ActiveRecord::Migration
  def up
  	change_column :users, :number, :integer
  end

  def down
  	change_column :users, :number, :number
  end
end
