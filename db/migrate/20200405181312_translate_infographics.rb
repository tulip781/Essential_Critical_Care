class TranslateInfographics < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Infographic.create_translation_table!({
          :title => :string
        }, {
          :migrate_data => true,
          :remove_source_columns => true
        })
      end

      dir.down do
        Infographic.drop_translation_table! :migrate_data => true
      end
    end
  end
end
