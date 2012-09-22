class CanvasCloner
  def initialize canvas, printer_class, creator_class, canvas_class, default_value
    @canvas = canvas
    @printer_class = printer_class
    @creator_class = creator_class
    @canvas_class = canvas_class
    @default_value = default_value
  end

  def clone
    string_representation = @printer_class.new(@canvas).print
    creator = @creator_class.new(string_representation, @canvas_class, @default_value)
    creator.generate_canvas
  end
end
