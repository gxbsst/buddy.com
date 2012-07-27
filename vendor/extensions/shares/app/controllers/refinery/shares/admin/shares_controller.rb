module Refinery
  module Shares
    module Admin
      class SharesController < ::Refinery::AdminController

        crudify :'refinery/shares/share',
                :title_attribute => 'people_name', :xhr_paging => true

      end
    end
  end
end
