module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :begin_at, :address, :category, :content, :photo, :position, :photo_id,:select_show,:event_end

      acts_as_indexed :fields => [:title, :address, :category, :content]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
