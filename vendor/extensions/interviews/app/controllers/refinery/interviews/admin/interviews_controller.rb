module Refinery
  module Interviews
    module Admin
      class InterviewsController < ::Refinery::AdminController

        crudify :'refinery/interviews/interview',
                :title_attribute => 'people_name', :xhr_paging => true

      end
    end
  end
end
