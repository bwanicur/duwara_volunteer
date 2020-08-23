class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone
      t.string :info
      t.boolean :active, default: true, null: false
      t.boolean :receive_emails, default: true, null: false

      t.timestamps
    end
    add_index :volunteers, :email, unique: true
  end
end
