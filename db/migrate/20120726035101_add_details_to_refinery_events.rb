class AddDetailsToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :select_show, :boolean
    add_column :refinery_events, :event_end, :boolean
  end
end
