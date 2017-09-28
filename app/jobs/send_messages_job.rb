class SendMessagesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    #binding.pry
    # args[0] >> volunters
    # args[1] >> message
    SendSms.call(volunters: args[0], message: args[1] )
  end
end
