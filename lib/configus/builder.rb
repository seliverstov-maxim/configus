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
    data = Configus::ProxyBuilder.build(block)
    @envs[name] = data
  end

  def configus
    Configus::Config.new(@envs[@env])
  end
end
