class CreateUnitTrustEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_trust_entries do |t|
      t.date :date
      t.float :value
      t.float :last_day
      t.float :last_30_days
      t.float :last_90_days
      t.float :last_12_months
      t.integer :unit_trust_id

      t.timestamps
    end
    add_index :unit_trust_entries, :unit_trust_id
  end
end
