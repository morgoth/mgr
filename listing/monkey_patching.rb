unless Array.method_defined? :shuffle
  class Array
    def shuffle
      self.sort_by { Kernel.rand }
    end
  end
end