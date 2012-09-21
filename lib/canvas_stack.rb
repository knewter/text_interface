class CanvasStack
  attr_reader :layers
  def initialize
    @layers = []
  end

  def add_layer(layer, position=-1)
    @layers.insert(position, layer)
  end

  def remove_layer(layer)
    @layers.delete(layer)
  end
end
