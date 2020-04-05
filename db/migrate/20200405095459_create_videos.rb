class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.references :sub_category, foreign_key: true
      t.references :category, foreign_key: true
      t.references :secret_category, foreign_key: true
      t.references :secret_sub_category, foreign_key: true

      t.timestamps
    end
  end
end
