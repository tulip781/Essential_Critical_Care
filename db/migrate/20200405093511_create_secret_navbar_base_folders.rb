class CreateSecretNavbarBaseFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_navbar_base_folders do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
