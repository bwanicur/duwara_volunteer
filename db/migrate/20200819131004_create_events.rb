class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :event_type_id, null: false
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :max_volunteers
      t.boolean :is_template, default: false
      t.timestamps
    end
  end
end
