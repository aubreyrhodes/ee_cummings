module EECummings
  class VariableValidator
    def is_valid?(definition, value)
      value =~ definition.regex
    end
  end
end
