require_relative 'spec_helper'

describe 'lwrp_test::default' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['ini_file']).converge(described_recipe)
  end

  before(:each) do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_return(true)
  end

  it 'creates an ini file with default attributes' do
    expect(chef_run).to create_file('/tmp.ini').with(
      atomic_update: true,
      backup: 5,
      group: nil,
      inherits: nil,
      mode: nil,
      owner: nil
    )
  end

  it 'creates an ini file with explicit attributes' do
    expect(chef_run).to create_file('/tmp/explicit_attributes1.ini').with(
      atomic_update: true,
      backup: false,
      group: 1,
      inherits: true,
      mode: 755,
      owner: 2
    )

    expect(chef_run).to create_file('/tmp/explicit_attributes2.ini').with(
      atomic_update: false,
      backup: 1,
      group: 'outie',
      inherits: false,
      mode: '0755',
      owner: 'outey'
    )

    expect(chef_run).to delete_file('/tmp/delete.ini')

    expect(chef_run).to render_file('/tmp/create_if_missing.ini')

    expect(chef_run).to touch_file('/tmp/touch.ini')
  end
end
