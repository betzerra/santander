class ChangeDescriptionUnitTrustColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :unit_trusts, :description, :text
  end
end
