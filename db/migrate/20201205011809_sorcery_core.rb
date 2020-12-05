class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone
      t.string :info
      t.boolean :active, default: true, null: false
      t.boolean :receive_emails, default: true, null: false
      t.string :roles, array: true, default: []

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
