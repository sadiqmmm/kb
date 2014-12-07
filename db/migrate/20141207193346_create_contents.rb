class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :description
      t.references :title, index: true

      t.timestamps null: false
    end
    add_foreign_key :contents, :titles
  end
end
