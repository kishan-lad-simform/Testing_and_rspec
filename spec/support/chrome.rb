RSpec.configure do |config|
  config.before(:each, type: :system) do
    if ENV["SHOW_BROWSER"] == "true"
      driven_by :selenum_chrome
    else
      driven_by :selenum, using: headless_chrome, screen_size: [1400, 1400]
    end
  end
end