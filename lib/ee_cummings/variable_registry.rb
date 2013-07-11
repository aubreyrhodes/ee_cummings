module EECummings
  class VariableRegistry
    attr_reader :variables

    def initialize(variable_definition_class = VariableDefinition)
      @variable_definition_class = variable_definition_class
      @variables = []
    end

    def variable
      variable = new_variable_definition
      yield variable
      @variables << variable
    end

    private

    def new_variable_definition
      @variable_definition_class.new
    end
  end
end
