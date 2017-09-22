class Alert < ActiveRecord::Base
  belongs_to :category

  validates :category_id, presence: true

  def subscribed_users
    Contact.where(id: Contact.with_all_categories([category_id]))
  end
end
