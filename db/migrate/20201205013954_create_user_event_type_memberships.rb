class CreateUserEventTypeMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :user_event_type_memberships do |t|
      t.integer :user_id, null: false
      t.integer :event_type_id, null: false

      t.timestamps
    end

    add_index :user_event_type_memberships, %i[user_id event_type_id], unique: true
  end
end
