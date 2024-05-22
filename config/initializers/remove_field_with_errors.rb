# config/initializers/remove_field_with_errors.rb
Rails.application.config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag.html_safe }
