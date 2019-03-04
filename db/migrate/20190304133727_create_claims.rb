class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :affair
      t.string :description
      t.date :claim_date

      t.timestamps
    end
  end
end
