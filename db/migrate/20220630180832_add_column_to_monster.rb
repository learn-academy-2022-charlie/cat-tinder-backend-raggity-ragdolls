class AddColumnToMonster < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :image, :text
  end
end
