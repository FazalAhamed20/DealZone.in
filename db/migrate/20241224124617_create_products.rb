class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end