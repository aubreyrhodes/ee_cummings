module EECummings
  class VariableSource
    def get_value(key)
      ENV[key]
    end
  end
end
