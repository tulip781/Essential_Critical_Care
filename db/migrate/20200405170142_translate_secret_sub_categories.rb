class TranslateSecretSubCategories < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        SecretSubCategory.create_translation_table!({
          :title => :string,
          :description => :text
        }, {
          :migrate_data => true,
          :remove_source_columns => true
        })
      end

      dir.down do
        SecretSubCategory.drop_translation_table! :migrate_data => true
      end
    end
  end
end
