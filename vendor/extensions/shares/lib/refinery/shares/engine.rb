module Refinery
  module Shares
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Shares

      engine_name :refinery_shares

      initializer "register refinerycms_shares plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "shares"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.shares_admin_shares_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/shares/share',
            :title => 'people_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Shares)
      end
    end
  end
end
