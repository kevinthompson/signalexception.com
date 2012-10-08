def page_class
  segments = path_array
  return 'home' if segments.empty?
  segments.join(' ')
end

def page_title
  title = current_page.data.title.try(:dup) || ''
  title << ' | ' unless title.empty?
  title << 'Kevin Thompson'
end