class RemoveColumnFromSecretCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :secret_categories, :has_secret_subcategory
  end
end
