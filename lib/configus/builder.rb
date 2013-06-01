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

    def apply_inheritance(env_name)
      env = @envs[env_name]
      parent_name = env.parent
      if parent_name
        parent_env = @envs[parent_name]

        apply_inheritance(parent_name)
        env.data = parent_env.data.merge(env.data)

        # HINT: Let it be here just for tracing purposes
        # puts "merge #{parent_name} to #{env_name}"
      end
    end

    def configus
      apply_inheritance(@env)
      Config.new(@envs[@env].data)
    end
  end
end

