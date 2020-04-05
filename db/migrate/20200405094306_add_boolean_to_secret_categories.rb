class AddBooleanToSecretCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :secret_categories, :has_secret_subcategory, :boolean, default: true
  end
end
