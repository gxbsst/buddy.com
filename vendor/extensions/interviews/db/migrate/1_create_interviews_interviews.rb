class CreateInterviewsInterviews < ActiveRecord::Migration

  def up
    create_table :refinery_interviews do |t|
      t.string :people_name
      t.string :title
      t.date :time
      t.text :content
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-interviews"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/interviews/interviews"})
    end

    drop_table :refinery_interviews

  end

end
