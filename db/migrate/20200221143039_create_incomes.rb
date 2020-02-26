class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.datetime :date
      t.string :description
      t.integer :price
      t.references:category
      t.integer :created_by
      t.integer :updated_by
      t.integer :deleted_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
