class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at, null: true

      t.timestamps
    end

    add_foreign_key :posts, :identities, column: :author_id, on_delete: :cascade
  end
end
