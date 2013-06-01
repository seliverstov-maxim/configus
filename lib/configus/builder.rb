module Configus
  class Builder
    def self.build(env, options = {}, &block)
      b = new(env, options, block)
      b.configus
    end

    def initialize(env, options = {}, block)
      @envs = {}
      @env = env
      instance_eval &block
    end

    def env(name, options = {}, &block)
      data = ProxyBuilder.build(block)
      @envs[name] = data
    end

    def configus
      Config.new(@envs[@env])
    end
  end
end
