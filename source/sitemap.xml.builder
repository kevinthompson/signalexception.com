base_url = "http://kevinthompson.info"

xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  # Blog Index
  xml.tag! 'url' do
    xml.tag! 'loc', base_url
    xml.tag! 'lastmod', blog.articles.first.date.to_time.iso8601
    xml.tag! 'changefreq', 'monthly'
    xml.tag! 'priority', '0.5'
  end

  # Articles
  blog.articles.each do |article|
    xml.tag! 'url' do
      xml.tag! 'loc', "#{base_url}#{article.url}"
      xml.tag! 'lastmod', article.date.to_time.iso8601
      xml.tag! 'changefreq', 'monthly'
      xml.tag! 'priority', '0.5'
    end
  end
end