class AddColumnDateToAccounnts < ActiveRecord::Migration[5.2]
  def change
    add_column(:accounts, :date_created, :date)
  end
end
