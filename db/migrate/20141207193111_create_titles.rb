class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :titles, :topics
  end
end
