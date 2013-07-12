require 'ee_cummings/variable_warehouse'

describe EECummings::VariableWarehouse do
  let(:variable_source){ double }
  let(:registry){ double(variables: [ double(name: 'test_name') ]) }
  let(:validator){ double(is_valid?: true) }

  subject{ EECummings::VariableWarehouse.new(variable_source, validator) }

  describe '#load_variables_from_registry' do

    before do
      variable_source.should_receive(:get_value).with('test_name')
    end

    it 'loads values from the variable source' do
      subject.load_variables_from_registry(registry)
    end

    it 'saves the error if the validator fails' do
      validator.stub(:is_valid?).and_return(false)
      subject.load_variables_from_registry(registry)
      expect(subject.errors.length).to eq(1)
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
