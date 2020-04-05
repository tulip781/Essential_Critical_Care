class CreateNavbarBaseFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :navbar_base_folders do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
