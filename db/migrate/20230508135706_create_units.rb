class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
    add_index :units, :name, unique: true
  end
end

