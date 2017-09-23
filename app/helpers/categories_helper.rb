module CategoriesHelper
  def categories_collection
    puts "estas en helpar"
    Category.all.collect{|u| [u.name, u.id]}
  end
end