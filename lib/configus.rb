require "configus/version"

module Configus
  def self.build env, &block
    Configus::Builder.build env, &block
  end

  autoload :Builder, 'configus/builder'
end
