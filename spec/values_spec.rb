require 'ee_cummings/values'

describe EECummings::Values do
  let(:warehouse){ double }

  subject{ Object.new.extend(EECummings::Values) }

  describe 'retrieveing values' do
    before do
      warehouse.stub(:get_value).with('TEST_KEY').and_return('test')
      subject.warehouse = warehouse
    end

    it 'returns the value for the right key with a method call' do
      expect(subject.test_key).to eq('test')
    end
  end
end
