class CreateEventUserMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :event_user_memberships do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false
      t.string :invite_hash, null: false
      t.string :response
      t.datetime :last_replied_on
      t.boolean :attended, default: true, null: false
      t.timestamps
    end
    add_index :event_user_memberships, %i[event_id user_id], unique: true, name: "event_user_mem_idx"
  end
end
