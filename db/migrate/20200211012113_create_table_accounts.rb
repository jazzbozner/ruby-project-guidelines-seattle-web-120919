class CreateTableAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table(:accounts) do |t|
      t.integer :user_id
      t.integer :website_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
