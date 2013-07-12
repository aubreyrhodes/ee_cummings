require 'ee_cummings/variable_validator'

describe EECummings::VariableValidator do
  let(:definition){ double(name: 'test_name', regex: /[a-z]+/) }

  describe '#is_valid?' do
    it 'returns true if the value is valid' do
      expect(subject.is_valid?(definition, 'test')).to be_true
    end

    it 'returns false if the value does not match the variables regex' do
      expect(subject.is_valid?(definition, '123')).to be_false
    end
  end
end
