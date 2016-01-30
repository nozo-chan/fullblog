class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
    add_column :comments, :text, :string
    add_column :comments, :user_id, :integer
  end
end
