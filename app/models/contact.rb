class Contact < ActiveRecord::Base
    has_many :categorizations
    has_many :categories, through: :categorizations
    
    def self.with_all_categories(category_ids)
        select(:id).distinct.
        joins(:categories).
        where('categories.id' => category_ids).
        group(:id).
        having('count(categories.id) = ?', category_ids.length)
    end
end
