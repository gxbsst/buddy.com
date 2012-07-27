# This migration comes from refinery_shares (originally 1)
class CreateSharesShares < ActiveRecord::Migration

  def up
    create_table :refinery_shares do |t|
      t.string :people_name
      t.date :time
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-shares"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/shares/shares"})
    end

    drop_table :refinery_shares

  end

end
