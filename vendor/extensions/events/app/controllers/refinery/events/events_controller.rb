module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_filter :find_all_events
      before_filter :find_page

      def index
        # # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        # present(@page)
        @event = @events.first
        @events =  Event.where("select_show = 0").order('position ASC, created_at DESC').limit(4)
      end

      def show
        @event = Event.find(params[:id])
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end
      
      def list
        params[:page] ||= 1
        @events = Event.paginate(:page => params[:page], :per_page => 2)
      end

    protected

      def find_all_events
        @events = Event.where("select_show = 1").order('position ASC, created_at DESC').limit(1)
        
      end

      def find_page
         @page = ::Refinery::Page.where(:link_url => "/events").first 
      end

    end
  end
end
 