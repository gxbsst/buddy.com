module Refinery
  module Interviews
    class InterviewsController < ::ApplicationController

      before_filter :find_all_interviews
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @interview in the line below:
        present(@page)
      end

      def show
        @interview = Interview.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @interview in the line below:
        present(@page)
      end

    protected

      def find_all_interviews
        @interviews = Interview.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/interviews").first
      end

    end
  end
end
