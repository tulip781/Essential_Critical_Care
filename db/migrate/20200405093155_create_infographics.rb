class CreateInfographics < ActiveRecord::Migration[5.2]
  def change
    create_table :infographics do |t|
      t.string :title
      t.references :sub_category, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
