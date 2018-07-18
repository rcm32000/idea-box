class AddImageIdToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :image_id, :integer
  end
end
