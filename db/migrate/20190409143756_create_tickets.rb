class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :email
      t.text :text
      t.references :agent, foreign_key: true

      t.timestamps
    end
  end
end
