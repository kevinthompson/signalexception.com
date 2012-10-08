def articles_by_month
  blog.articles.group_by do |article|
    "#{Date::MONTHNAMES[article.date.month]} #{article.date.year}"
  end
end