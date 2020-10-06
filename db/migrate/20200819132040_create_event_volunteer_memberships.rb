class CreateEventVolunteerMemberships < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      CREATE TYPE response_enum AS ENUM ('NO', 'YES', 'PENDING', 'WAITING_LIST')
    SQL
    
    create_table :event_volunteer_memberships do |t|
      t.integer :event_id, null: false
      t.integer :volunteer_id, null: false
      t.string :invite_hash, null: false
      t.datetime :last_replied_on
      t.boolean :attended, default: true, null: false
      t.timestamps
    end
    add_column :event_volunteer_memberships, :response, :response_enum, null: false, default: 'PENDING'
    add_index :event_volunteer_memberships, [:event_id, :volunteer_id], unique: true, name: "event_volunteer_mem_idx"
  end
end
