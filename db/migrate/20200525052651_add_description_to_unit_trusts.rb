class AddDescriptionToUnitTrusts < ActiveRecord::Migration[6.0]
  def change
    add_column :unit_trusts, :description, :string
  end
end
