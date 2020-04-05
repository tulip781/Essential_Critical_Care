class AddPinsToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :pdfs, :pinned?, :boolean, default: false
    add_column :videos, :pinned?, :boolean, default: false
    add_column :infographics, :pinned?, :boolean, default: false
  end
end
