class Configus::ProxyBuilder
  def self.build(block)
    pb = new(block)
    pb.data
  end

  def initialize(block)
    @data = {}
    instance_eval &block
  end

  def method_missing(name, *args, &block)
    if block
      @data[name] = Configus::ProxyBuilder.build(block)
    else
      @data[name] = args[0]
    end
  end

  def data
    @data
  end
end
