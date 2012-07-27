module Refinery
  module Shares
    class Share < Refinery::Core::BaseModel
      self.table_name = 'refinery_shares'

      attr_accessible :people_name, :time, :content, :position, :photo_id

      acts_as_indexed :fields => [:people_name, :content]

      validates :people_name, :presence => true, :uniqueness => true
      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
