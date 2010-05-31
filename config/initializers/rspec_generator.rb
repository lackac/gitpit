Gitpit::Application.configure do
  config.generators do |g|
    g.integration_tool :rspec
    g.test_framework   :rspec, :fixture_replacement => :factory_girl, :views => false
  end
end
