require 'ee_cummings/variable_warehouse'

describe EECummings::VariableWarehouse do
  let(:variable_source){ double }
  let(:registry){ double(variables: [ double(name: 'test_name') ]) }

  subject{ EECummings::VariableWarehouse.new(variable_source) }

  describe '#load_variables_from_registry' do

    it 'loads values from the variable source' do
      variable_source.should_receive(:get_value).with('test_name')
      subject.load_variables_from_registry(registry)
    end
  end

  describe '#get_value' do
    it 'returns loaded values by key' do
      variable_source.should_receive(:get_value).with('test_name').and_return('test')
      subject.load_variables_from_registry(registry)
      expect(subject.get_value('test_name')).to eq('test')
    end
  end
end
