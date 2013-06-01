class Configus::Config
  def initialize(data)
    @data = data
  end

  def method_missing(name, *args, &block)

  end
end
