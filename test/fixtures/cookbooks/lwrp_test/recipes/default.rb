ini_file '/tmp.ini'

ini_file '/tmp/explicit_attributes1.ini' do
  atomic_update true
  backup false
  group 1
  inherits true
  mode 755
  owner 2
end

ini_file '/tmp/explicit_attributes2.ini' do
  atomic_update false
  backup 1
  group 'outie'
  inherits false
  mode '0755'
  owner 'outey'
end

ini_file '/tmp/delete.ini' do
  action :delete
end
