require 'fly/version'

require 'sprockets-sass'

module Fly
  def self.settings
    @settings ||= {}
  end

  def self.configure(options = {})
    self.settings[:assets_dir] ||= File.expand_path('../../public/assets', __FILE__) # lib/../public/assets
  end

  module Sprockets
    # Append assets path to an existing Sprockets environment
    def self.setup(environment)
      %w[ fonts stylesheets ].each do |path|
        path = File.join(File.expand_path('../../assets', __FILE__), path) # lib/../assets/{path}
        environment.append_path(path)
      end
    end

    module Helpers
      AssetNotFoundError = Class.new(StandardError)
      def asset_path(source, options = {})
        asset = environment.find_asset(source)
        raise AssetNotFoundError.new("#{source.inspect} does not exist within #{environment.paths.inspect}!") unless asset
        "./#{asset.digest_path}"
      end
    end
  end
end
