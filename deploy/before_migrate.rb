## This will be invoked on deployment before migration happens

# rails_env = new_resource.environment['RAILS_ENV']

release_path = Pathname.new(__FILE__).dirname.join('..').expand_path
bunlde_path = release_path.join('..', '..', 'shared', 'bundle')

# bundle gems
run "cd #{release_path} && bundle install #{bunlde_path} --without test --without development"
