xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blog Aer de Vacanta"
    xml.description "This is a blog by My Company"
    xml.link root_url
    xml.item do
        xml.title @article.title
        xml.description @article.body
        xml.pubDate @article.date.to_s(:rfc822)
        xml.link article_url(@article.slug)
        xml.guid article_url(@article.slug)
    end
  end
end