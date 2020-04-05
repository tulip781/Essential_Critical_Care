class AddSecretToInfographics < ActiveRecord::Migration[5.2]
  def change
    add_reference :infographics, :secret_category, foreign_key: true
    add_reference :infographics, :secret_sub_category, foreign_key: true
  end
end
