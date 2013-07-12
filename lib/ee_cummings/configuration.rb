module EECummings
  module Configuration
    def configure
      variable_list = variable_registry
      yield variable_list
      variable_warehouse.load_variables_from_registry(variable_list)
      if variable_warehouse.errors.length > 0
        raise_errors(variable_warehouse.errors)
      end
      self.warehouse = variable_warehouse
    end

    def variable_registry=(registry)
      @variable_registry = registry
    end

    def variable_warehouse=(warehouse)
      @variable_warehouse = warehouse
    end

    def cleanup
      @variable_registry = nil
      @variable_warehouse = nil
    end

    private

    def variable_registry
      @variable_registry ||= EECummings::VariableRegistry.new
    end

    def variable_warehouse
      @variable_warehouse ||= EECummings::VariableWarehouse.new
    end

    def raise_errors(errors)
      raise MisconfiguredVariable.new "The following variables are missing or misconfigured: #{ errors.join(',') }"
    end
  end
end
