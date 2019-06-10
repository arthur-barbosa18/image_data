Rails.application.config.app_generators do |g|
  g.stylesheets false
  g.helper false
  g.test_framework(
    :rspec,
    helper_specs: false,
    routing_specs: false,
    view_specs: false
  )
end
