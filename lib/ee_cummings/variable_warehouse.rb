module EECummings
  class VariableWarehouse
    attr_reader :variable_source, :errors, :validator

    def initialize(variable_source = VariableSource.new, validator = VariableValidator.new)
      @variable_source = variable_source
      @validator = validator
      @variables = {}
      @errors = []
    end

    def load_variables_from_registry(registry)
      registry.variables.each do |var|
        value = variable_source.get_value(var.name)
        if validator.is_valid?(var, value)
          @variables[var.name] = value
        else
          @errors << var.name
        end
      end
    end

    def get_value(key)
      @variables[key]
    end
  end
end
