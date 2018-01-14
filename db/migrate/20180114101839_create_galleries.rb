class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
