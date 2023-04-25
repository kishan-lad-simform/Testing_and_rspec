class AddReferenceOfUserInProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :test_products, :user, foreign_key: true 
    
  end
end
