class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :chapters, :books
  end
end
