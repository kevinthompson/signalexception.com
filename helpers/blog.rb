def articles_by_month
  blog.articles.group_by do |article|
    "#{Date::MONTHNAMES[article.date.month]} #{article.date.year}"
  end
end

def article_title(title)
  title_parts = title.split(/\s/)
  end_of_title = title_parts.pop(2).join('&nbsp;')
  beginning_of_title = title_parts.join(' ')
  "#{beginning_of_title} #{end_of_title}"
end
