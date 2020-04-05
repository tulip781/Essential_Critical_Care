class AddLanguageBooleanToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :pdfs, :english?, :boolean, default: true
    add_column :videos, :english?, :boolean, default: true
    add_column :infographics, :english?, :boolean, default: true
  end
end
