module EECummings
  class VariableWarehouse
    attr_reader :variable_source

    def initialize(variable_source = VariableSource.new)
      @variable_source = variable_source
      @variables = {}
    end

    def load_variables_from_registry(registry)
      registry.variables.each do |var|
        @variables[var.name] = variable_source.get_value(var.name)
      end
    end

    def get_value(key)
      @variables[key]
    end
  end
end
