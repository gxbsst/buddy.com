module Refinery
  module Interviews
    class Interview < Refinery::Core::BaseModel
      self.table_name = 'refinery_interviews'

      attr_accessible :people_name, :title, :time, :content, :photo, :position, :photo_id

      acts_as_indexed :fields => [:people_name, :title, :content]

      validates :people_name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
