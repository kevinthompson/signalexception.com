def page_title
  title = current_page.data.title.try(:dup) || ''
  title << ' | ' unless title.empty?
  title << 'SignalException by Kevin Thompson'
end
