require 'ee_cummings/variable_validator'

describe EECummings::VariableValidator do
  let(:definition){ double(name: 'test_name') }

  describe '#is_valid?' do
    it 'returns true if the value is valid' do
      expect(subject.is_valid?(definition, 'test')).to be_true
    end

    it 'returns false if the value is nil' do
      expect(subject.is_valid?(definition, nil)).to be_false
    end
  end
end
