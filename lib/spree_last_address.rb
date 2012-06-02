class SpreeLastAddress < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_last_address.preferences", :after => "spree.environment" do |app|
      Config = LastAddressConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
end
