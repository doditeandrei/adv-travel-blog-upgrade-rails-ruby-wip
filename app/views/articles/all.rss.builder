xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Aer de Vacanta"
    xml.description "Un blog de calatorii si aventuri"
    xml.link root_url

    @rss_articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.date.to_s(:rfc822)
        xml.link article_url(article.slug)
        xml.guid article_url(article.slug)
      end
    end
  end
end