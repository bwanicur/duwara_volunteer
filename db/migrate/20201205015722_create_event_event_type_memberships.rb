class CreateEventEventTypeMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :event_event_type_memberships do |t|
      t.integer :event_id
      t.integer :event_type_id

      t.timestamps
    end
    add_index :event_event_type_memberships, :event_id
  end
end
