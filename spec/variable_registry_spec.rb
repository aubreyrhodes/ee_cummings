require 'ee_cummings/variable_registry'

describe EECummings::VariableRegistry do

  class MockVariableDefinition; end

  subject{ EECummings::VariableRegistry.new(MockVariableDefinition) }

  describe '#variable' do
    it 'yields a variable definition' do
      expect{ |b| subject.variable(&b) }.to yield_with_args(MockVariableDefinition)
    end
  end

  describe '#variables' do
    it 'keeps track of variables that were registered' do
      3.times do subject.variable{} end
      expect(subject.variables.length).to eq(3)
    end
  end
end
