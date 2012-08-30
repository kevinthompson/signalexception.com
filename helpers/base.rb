def body_attributes
  attributes = {}

  # Classes
  invalid_class_names = %w[index]
  segments = request.path.gsub(/(\.\w+|\/)$/,'').sub(/^\//,'').split('/').compact
  segments = segments.reject{ |s| invalid_class_names.include? s }
  segments = ['home'] if segments.empty?
  attributes[:class] = segments.join(' ')

  attributes
end