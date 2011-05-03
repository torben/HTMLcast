module Modules::CategorySelector
  def set_category_tree
    @categories = Category.all.each { |c| 
        c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s 
      }.sort {|x,y|
        x.ancestry <=> y.ancestry 
      }.map{ |c| 
        [("&#0160;" * 2 * (c.depth - 1) + c.title).html_safe,c.id]
      }.unshift(["-- none --", nil])
  end
end