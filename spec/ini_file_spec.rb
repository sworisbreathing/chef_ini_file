require_relative 'spec_helper'

describe 'lwrp_test::default' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['ini_file']).converge(described_recipe)
  end

  before(:each) do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_return(true)
  end

  it 'creates an ini file' do
    expect(chef_run).to create_file('/tmp.ini')
  end

  it 'creates an ini file with explicit attributes' do
    expect(chef_run).to create_file('/tmp/explicit_attributes1.ini').with(
      atomic_update: true
    )
    expect(chef_run).to create_file('/tmp/explicit_attributes2.ini').with(
      atomic_update: false
    )
  end
end
