class EventTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_types do |t|
      t.string :key, null: false
      t.string :display_name, null: false
      t.string :icon

      t.timestamps null: false
    end
  end
end
