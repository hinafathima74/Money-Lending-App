class CreateLoans < ActiveRecord::Migration[7.2]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.decimal :amount
      t.decimal :interest_rate
      t.decimal :total_amount
      t.string :status

      t.timestamps
    end
  end
end
