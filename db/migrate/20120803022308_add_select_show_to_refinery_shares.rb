class AddSelectShowToRefineryShares < ActiveRecord::Migration
  def change
    add_column :refinery_shares, :select_show, :boolean
  end
end
