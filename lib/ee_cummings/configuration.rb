module EECummings
  module Configuration
    def configure
      variable_list = variable_registry
      yield variable_list
      variable_warehouse.load_variables_from_registry(variable_list)
      self.warehouse = variable_warehouse
    end

    def variable_registry=(registry)
      @variable_registry = registry
    end

    def variable_warehouse=(warehouse)
      @variable_warehouse = warehouse
    end

    private

    def variable_registry
      @variable_registry ||= EECummings::VariableRegistry.new
    end

    def variable_warehouse
      @variable_warehouse ||= EECummings::VariableWarehouse.new
    end
  end
end
