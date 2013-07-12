module EECummings
  class VariableDefinition < Struct.new(:name, :regex)
    def initialize
      self.regex = /.*/
    end
  end
end
