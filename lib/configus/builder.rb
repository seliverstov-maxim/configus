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
      node = ConfigNode.new(options[:parent], data)
      @envs[name] = node
    end

    def apply_inheritance(env)
      puts env
      parent_name = @envs[env].parent
      if parent_name
        parent_evn = @envs[parent_name]
        apply_inheritance(parent_name)
        @envs[env].data.deep_merge!(parent_evn.data)
      end
    end

    def configus
      apply_inheritance(@env)
      Config.new(@envs[@env].data)
    end
  end
end

