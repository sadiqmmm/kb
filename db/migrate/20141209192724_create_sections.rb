class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.references :chapter, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :chapters
  end
end
