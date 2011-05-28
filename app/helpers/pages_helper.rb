module PagesHelper
  def build_navigation(pages)
    pages.map do |page, sub_pages|
      render(:partial => 'pages/page', :locals => { :page => page }) + content_tag(:div, build_navigation(sub_pages), :class => "nested_pages")
    end.join.html_safe
  end

  def current_page?(page)
    params[:controller] == 'pages' && params[:action] == 'show' && params[:id].to_i == page.id
  end
end
