class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.boolean :has_subcategory, default: true
      t.references :navbar_base_folder, foreign_key: true

      t.timestamps
    end
  end
end
