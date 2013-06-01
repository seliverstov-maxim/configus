module Configus
  class ConfigNode
    attr_accessor :parent, :data

    def initialize(parent, data)
      @parent = parent
      @data = data
    end
  end
end
