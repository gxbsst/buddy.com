class AddDetailsToRefineryShares < ActiveRecord::Migration
  def change
    add_column :refinery_shares, :photo_id, :integer
  end
end
