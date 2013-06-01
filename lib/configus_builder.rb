class ConfigusBuilder
  def build &block
    @building = true
    instance_eval &block
    @building = false
  end

  def method_missing name, *args, &block
    if @building
      instance_variable_set("@#{name}".to_sym, args[0])
      self.class.send(:define_method, name, proc { instance_variable_get("@#{name}") })
    else
      instance_variable_get("@#{name}")
    end
  end
end
