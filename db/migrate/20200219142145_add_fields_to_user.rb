class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string, default: ""
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name, :string, default: ""
    add_column :users, :language, :integer, default: 1
    add_reference :users, :theme, null: false, foreign_key: true, default: 1
  end
end
