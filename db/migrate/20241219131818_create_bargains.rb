class CreateBargains < ActiveRecord::Migration[8.0]
  def change
    create_table :bargains do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :actual_amount
      t.integer :proposed_amount
      t.string :status

      t.timestamps
    end
  end
end
