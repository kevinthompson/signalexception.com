def back_link(*args)
  return if path_array.empty?
  segments = path_array[0...-1]
  text = link_text(segments[-1])
  href = '/'
  href << segments.join('/')
  link_to content_tag(:span, text), href, *args
end

def path_array
  request.path.split('/').reject{ |s| s === 'index.html' || s.empty? }.uniq.compact
end

def link_text(arg = '')
  raise Exceptions::InvalidInputType unless [String, Array].include? arg.class
  arg = 'Home' if arg == ''
  arg = arg[-1] if arg.is_a? Array
  arg.capitalize
end