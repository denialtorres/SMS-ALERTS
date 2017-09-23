module CategoriesHelper
  def categories_collection
    Category.all.collect{|u| [u.name, u.id]}
  end
end