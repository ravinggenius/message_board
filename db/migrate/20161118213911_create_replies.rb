class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.references :author, null: false
      t.references :post, null: false
      t.text :body, null: false
      t.datetime :published_at, null: true

      t.timestamps
    end

    add_foreign_key :replies, :identities, column: :author_id, on_delete: :cascade
    add_foreign_key :replies, :posts, on_delete: :cascade
  end
end
