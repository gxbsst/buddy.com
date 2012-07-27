module Refinery
  module Interviews
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Interviews

      engine_name :refinery_interviews

      initializer "register refinerycms_interviews plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "interviews"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.interviews_admin_interviews_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/interviews/interview',
            :title => 'people_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Interviews)
      end
    end
  end
end
