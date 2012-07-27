module Refinery
  module Shares
    class SharesController < ::ApplicationController

      before_filter :find_all_shares
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @share in the line below:
        @interviews = Refinery::Interviews::Interview.all
        present(@page)
      end

      def show
        @share = Share.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @share in the line below:
        present(@page)
      end

    protected

      def find_all_shares
        @shares = Share.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/shares").first
      end

    end
  end
end
