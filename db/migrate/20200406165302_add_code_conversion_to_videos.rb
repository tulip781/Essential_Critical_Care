class AddCodeConversionToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :url_code, :string
  end
end
