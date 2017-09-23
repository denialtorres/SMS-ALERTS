class SendSms
  include Interactor

  def call
    # TODO
    @client = Twilio::REST::Client.new
    context.volunters.each do |contact|
       @client.api.account.messages.create({
         :from => '+15627312206',
         :to => "+52#{contact.phone}",
         :body => context.message,
       })
     end  
  end
end
