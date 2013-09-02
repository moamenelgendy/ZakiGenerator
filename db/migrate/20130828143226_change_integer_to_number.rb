class ChangeIntegerToNumber < ActiveRecord::Migration
  def up
  	change_column :users, :number, :integr
  end

  def down
  	change_column :users, :number, :number
  end
end
