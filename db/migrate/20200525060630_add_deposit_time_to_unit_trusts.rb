class AddDepositTimeToUnitTrusts < ActiveRecord::Migration[6.0]
  def change
    add_column :unit_trusts, :deposit_time, :integer
  end
end
