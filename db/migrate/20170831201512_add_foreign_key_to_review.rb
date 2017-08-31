class AddForeignKeyToReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :product_id
    remove_column :reviews, :user_id
    add_reference :reviews, :product, index: true, foreign_key: true
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
