RSpec.configure do |config|
  config.after do
    Database.instance.tear_down
  end
end
