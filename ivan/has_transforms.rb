module HasTransforms
  private
    def delegate_transforms(transforms) 
      transforms.each do |method_name|
        define_method(method_name) do |param|
          @points = @points.map do |p|
            p.send(method_name, param)
          end
          return self
        end
      end
    end

    def has_transforms_for(*class_names)
      transform_methods = []
      class_names.each do |c|
        transform_methods += c.transforms
      end
      transform_methods.uniq!
      delegate_transforms(transform_methods)
    end

end