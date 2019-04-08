class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.boolean :sender
      t.references :ticket

      t.timestamps
    end
  end
end
