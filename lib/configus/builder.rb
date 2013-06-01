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
      if options[:parent]
        data[:parent] = options[:parent]
      end
      @envs[name] = data
    end

    def configus
      data = merge_parent(@envs[@env])
      Config.new(data)
    end

    def merge_parent(data)
      if data[:parent]
        key = data[:parent]
        data.delete(:parent)
        data.merge!(@envs[key])
        merge_parent(data)
      end
      data
    end
  end
end
