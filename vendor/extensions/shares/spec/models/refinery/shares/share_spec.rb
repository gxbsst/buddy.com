require 'spec_helper'

module Refinery
  module Shares
    describe Share do
      describe "validations" do
        subject do
          FactoryGirl.create(:share,
          :people_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:people_name) { should == "Refinery CMS" }
      end
    end
  end
end
