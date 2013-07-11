require 'ee_cummings/configuration'
require 'ee_cummings/variable_registry'

describe EECummings::Configuration do
  let(:variable_registry){ double }
  let(:variable_warehouse){ double }

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
end
