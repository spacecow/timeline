require 'i18n'

I18n.enforce_available_locales = false

unless defined?(require_dependency)
  def require_dependency(*files)
    require *files
  end
end
