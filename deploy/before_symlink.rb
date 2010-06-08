## This will be invoked on deployment before the release is symlinked

# rails_env = new_resource.environment['RAILS_ENV']

release_path = Pathname.new(__FILE__).dirname.join('..').expand_path

run "cd #{release_path} && bundle exec compass --force -s compressed"
