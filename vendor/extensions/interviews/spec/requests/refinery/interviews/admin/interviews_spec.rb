# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Interviews" do
    describe "Admin" do
      describe "interviews" do
        login_refinery_user

        describe "interviews list" do
          before(:each) do
            FactoryGirl.create(:interview, :people_name => "UniqueTitleOne")
            FactoryGirl.create(:interview, :people_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.interviews_admin_interviews_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.interviews_admin_interviews_path

            click_link "Add New Interview"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "People Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Interviews::Interview.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("People Name can't be blank")
              Refinery::Interviews::Interview.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:interview, :people_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.interviews_admin_interviews_path

              click_link "Add New Interview"

              fill_in "People Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Interviews::Interview.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:interview, :people_name => "A people_name") }

          it "should succeed" do
            visit refinery.interviews_admin_interviews_path

            within ".actions" do
              click_link "Edit this interview"
            end

            fill_in "People Name", :with => "A different people_name"
            click_button "Save"

            page.should have_content("'A different people_name' was successfully updated.")
            page.should have_no_content("A people_name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:interview, :people_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.interviews_admin_interviews_path

            click_link "Remove this interview forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Interviews::Interview.count.should == 0
          end
        end

      end
    end
  end
end
