class Alert < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  PAGE_SIZE = 6

  belongs_to :category
  has_many   :contacts, through: :category
  after_create_commit	:send_sms
  
  validates :category_id, presence: true

  scope :page, -> (page) { offset((page - 1) * PAGE_SIZE).limit(PAGE_SIZE) }

  def self.next_page(current_page)
    next_page = current_page + 1
    next_page if page(next_page).count > 0
  end

  # deprecated, use `contacts` instead
  def subscribed_users
    Contact.where(id: Contact.with_all_categories([category_id]))
  end
  
  def send_sms
    SendSms.call(volunters: subscribed_users, message: message )
  end
end
