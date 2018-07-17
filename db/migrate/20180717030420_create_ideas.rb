class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
