class AddLanguageToPdf < ActiveRecord::Migration[5.2]
  def change
    add_column :pdfs, :lao?, :boolean, default: false
    add_column :pdfs, :both_languages?, :boolean, default: false
  end
end
