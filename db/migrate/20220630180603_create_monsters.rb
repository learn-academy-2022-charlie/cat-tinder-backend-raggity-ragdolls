class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :age
      t.text :specialty
      t.text :quote

      t.timestamps
    end
  end
end
