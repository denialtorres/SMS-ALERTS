class Alert < ActiveRecord::Base
  belongs_to :category
  has_many   :contacts, through: :category

  validates :category_id, presence: true

  # deprecated, use `contacts` instead
  def subscribed_users
    Contact.where(id: Contact.with_all_categories([category_id]))
  end
end
