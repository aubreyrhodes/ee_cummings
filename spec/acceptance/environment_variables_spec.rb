require 'ee_cummings'

describe 'Managing Environment Variables' do
  context 'an environment variable is present' do
    let(:variable_value){ 'test' }

    before do
      ENV['EE_CUMMINGS_TEST_VAR'] = variable_value
    end

    it 'allows a user to require an environment variable' do
      EECummings.configure do |c|
        c.variable do |var|
          var.name = 'EE_CUMMINGS_TEST_VAR'
        end
      end

      expect(EECummings.ee_cummings_test_var).to eq(variable_value)
    end

    it 'throws an exception if a configured variable is missing' do
      expect do
        EECummings.configure do |c|
          c.variable do |var|
            var.name = 'MISSING_VARIABLE'
          end
        end
      end.to raise_error(EECummings::MisconfiguredVariable)
    end
  end
end
