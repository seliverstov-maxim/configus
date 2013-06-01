class Configus::Builder
  def self.build(env, &block)
    b = new(env, block)
    b.configus
  end

  def initialize(env, block)
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
