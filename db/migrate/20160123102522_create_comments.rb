class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :commenter 
    	t.text :body 
    	t.reference :post 
    	
      t.timestamps null: false
    end
  end
end
