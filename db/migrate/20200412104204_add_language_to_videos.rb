class AddLanguageToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :lao?, :boolean, default: false
    add_column :videos, :both_languages?, :boolean, default: false
  end
end
