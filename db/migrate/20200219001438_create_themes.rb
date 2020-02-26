class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :color
      t.integer :created_by
      t.integer :updated_by
      t.integer :deleted_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
