module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :begin_at, :address, :category, :content, :photo, :position, :photo_id,:select_show,:event_end

      acts_as_indexed :fields => [:title, :address, :category, :content]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      after_save :update_select_show

      def update_select_show
       if select_show.present?
       	#TODO
       	# 取消之前选择
       	old_events = self.class.where(["id !=? ", id])

       	 unless old_events.blank?
	          old_events.each do |event|
		      event.update_column(:select_show, 0)    	  	
       	 end 
	 
	    end
       end	
      end

    end
  end
end
