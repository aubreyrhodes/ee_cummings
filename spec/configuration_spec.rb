require 'ee_cummings/configuration'
require 'ee_cummings/misconfigured_variable'

describe EECummings::Configuration do
  let(:variable_registry){ double }
  let(:variable_warehouse){ double(errors: []) }

  subject{ Object.new.extend(EECummings::Configuration) }

  before do
    subject.variable_registry = variable_registry
    subject.variable_warehouse = variable_warehouse

    variable_warehouse.stub(:load_variables_from_registry)
    subject.stub(:warehouse=)
  end

  it 'yeilds a variable registry' do
    target = expect{ |b| subject.configure(&b)}.to yield_with_args(variable_registry)
  end

  it 'loads variables into the warehouse from the registry' do
    variable_warehouse.should_receive(:load_variables_from_registry).with(variable_registry)
    subject.configure{}
  end

  it 'sets the objects warehouse' do
    subject.should_receive(:warehouse=).with(variable_warehouse)
    subject.configure{}
  end

  it 'raises an error if there are misconfigured variables' do
    variable_warehouse.stub(:errors).and_return(['bad_variable'])
    expect{ subject.configure{} }.to raise_error(EECummings::MisconfiguredVariable)
  end
end
