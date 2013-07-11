require 'ee_cummings/variable_source'

describe EECummings::VariableSource do
  describe '#get_value' do
    it 'returns the value of an environment variable' do
      ENV['test_key'] = 'test'
      expect(subject.get_value('test_key')).to eq('test')
    end
  end
end
