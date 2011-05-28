module CategoriesHelper
  def build_categories(categories)
    categories.map do |category, sub_categories|
      render(:partial => 'categories/list', :locals => { :category => category }) + content_tag(:div, build_categories(sub_categories), :class => "nested_categories")
    end.join.html_safe
  end
end
