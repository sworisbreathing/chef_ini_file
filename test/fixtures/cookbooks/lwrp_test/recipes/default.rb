ini_file '/tmp.ini'

ini_file '/tmp/explicit_attributes1.ini' do
  atomic_update true
end

ini_file '/tmp/explicit_attributes2.ini' do
  atomic_update false
end
