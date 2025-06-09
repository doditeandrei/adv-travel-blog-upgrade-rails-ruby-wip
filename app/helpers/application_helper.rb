# frozen_string_literal: true

module ApplicationHelper
  def markdown(text)
    extensions = [tables: true]
    Markdown.new(text).to_html.html_safe
  end
end
