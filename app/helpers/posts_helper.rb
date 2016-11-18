module PostsHelper
  def render_to_html(text)
    Kramdown::Document.new(text).to_html.html_safe
  end
end
