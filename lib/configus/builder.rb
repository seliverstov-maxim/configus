class Configus::Builder
  def build(env, &block)
    instance_eval &block
  end

  def env(name, options = {}, &block)

  end

  def method_missing(name, *args, &block)
    if block
      define_method(name, block)
    else
      define_method(name) do
        args[0]
      end
    end
  end
end
