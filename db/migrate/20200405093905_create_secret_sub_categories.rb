class CreateSecretSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_sub_categories do |t|
      t.string :title
      t.text :description
      t.references :secret_category, foreign_key: true

      t.timestamps
    end
  end
end
