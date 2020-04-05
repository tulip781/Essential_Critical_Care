class CreateSecretCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_categories do |t|
      t.string :title
      t.text :description
      t.string :has_secret_subcategory, default: true
      t.references :secret_navbar_base_folder, foreign_key: true

      t.timestamps
    end
  end
end
