class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.integer :user_id

      t.timestamps
    end
  end
end
