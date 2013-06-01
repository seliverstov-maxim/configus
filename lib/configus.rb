require "configus/version"

module Configus
  def self.build env, &block
    Configus::Builder.build env, &block
  end

  autoload :Builder, 'configus/builder'
  autoload :ProxyBuilder, 'configus/proxy_builder'
  autoload :ConfigNode, 'configus/config_node'
  autoload :Config, 'configus/config'
end
