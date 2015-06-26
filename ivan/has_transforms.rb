module HasTransforms
  private
    def has_transforms(*transforms) 
      transforms.each do |method_name|
        define_method(method_name) do |param|
          @points = @points.map do |p|
            p.send(method_name, param)
          end
          return self
        end
      end
    end
end