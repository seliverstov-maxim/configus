class Configus::Config
  def initialize(data)
    @data = data

    @data.each do |k, v|
      define_singleton_method(k) do
        if v.is_a?(Hash)
          self.class.new(v)
        else
          v
        end
      end
    end
  end
end
