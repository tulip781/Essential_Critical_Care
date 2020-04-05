class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    def change
      add_column :users, :username, :string
    end
  end
end
