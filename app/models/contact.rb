class Contact < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, :phone, :email, presence: true
  validates :phone, numericality: true, length: { is: 10 }, uniqueness: true
  
  def self.with_all_categories(category_ids)
    select(:id).distinct.
    joins(:categories).
    where('categories.id' => category_ids).
    group(:id).
    having('count(categories.id) = ?', category_ids.length)
  end
end
