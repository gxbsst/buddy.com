# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Shares" do
    describe "Admin" do
      describe "shares" do
        login_refinery_user

        describe "shares list" do
          before(:each) do
            FactoryGirl.create(:share, :people_name => "UniqueTitleOne")
            FactoryGirl.create(:share, :people_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.shares_admin_shares_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.shares_admin_shares_path

            click_link "Add New Share"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "People Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Shares::Share.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("People Name can't be blank")
              Refinery::Shares::Share.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:share, :people_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.shares_admin_shares_path

              click_link "Add New Share"

              fill_in "People Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Shares::Share.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:share, :people_name => "A people_name") }

          it "should succeed" do
            visit refinery.shares_admin_shares_path

            within ".actions" do
              click_link "Edit this share"
            end

            fill_in "People Name", :with => "A different people_name"
            click_button "Save"

            page.should have_content("'A different people_name' was successfully updated.")
            page.should have_no_content("A people_name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:share, :people_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.shares_admin_shares_path

            click_link "Remove this share forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Shares::Share.count.should == 0
          end
        end

      end
    end
  end
end
