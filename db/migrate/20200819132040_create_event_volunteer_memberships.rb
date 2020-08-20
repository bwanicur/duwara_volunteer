class CreateEventVolunteerMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :event_volunteer_memberships do |t|
      t.integer :event_id, null: false
      t.integer :volunteer_id, null: false
      t.string :invite_hash, null: false
      t.boolean :response
      t.datetime :last_replied_on

      t.timestamps
    end
    add_index :event_volunteer_memberships, [:event_id, :volunteer_id], unique: true, name: "event_volunteer_mem_idx"
  end
end
