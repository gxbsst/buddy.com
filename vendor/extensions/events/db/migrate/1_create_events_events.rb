class CreateEventsEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events do |t|
      t.string :title
      t.date :begin_at
      t.string :address
      t.string :category
      t.text :content
      t.integer :photo_id
      t.integer :position
      t.boolean :select_show
      t.boolean :event_end

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

  end

end
