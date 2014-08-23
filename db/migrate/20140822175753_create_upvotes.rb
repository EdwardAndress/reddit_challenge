class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
