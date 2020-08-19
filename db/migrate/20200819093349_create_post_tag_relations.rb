class CreatePostTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tag_relations do |t|
      t.integer :post_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
    add_index :post_tag_relations, [:post_id, :tag_id], unique: true
  end
end
