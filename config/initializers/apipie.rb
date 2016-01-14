Apipie.configure do |config|
  config.app_name                = "Rails Resume"
  config.api_base_url            = "/rails_resume/api"
  config.doc_base_url            = "/rails_resume/api/docs"
  config.default_version         = "v1"
  config.copyright               = "&copy; #{Date.today.year} Rails Resume"
  config.app_info                = "Rails application to display a resume"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.validate                = false
end
