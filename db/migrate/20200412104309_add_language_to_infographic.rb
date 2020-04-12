class AddLanguageToInfographic < ActiveRecord::Migration[5.2]
  def change
    add_column :infographics, :lao?, :boolean, default: false
    add_column :infographics, :both_languages?, :boolean, default: false
  end
end
