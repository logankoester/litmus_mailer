module LitmusMailer
  class MailObserver
    class << self

      def delivered_email(mail)
        Litmus::Base.new( Config.subdomain, Config.username, Config.password, Config.ssl )

        # We can't add new versions through the API, and smtp settings are
        # rarely useable in development environments. For now, let's just
        # delete the pre-existing version to keep things from getting unweildy.
        if existing_test = Litmus::Test.find_by_name(mail.litmus_test)
          Litmus::EmailTest.destroy(existing_test['id'])
          Rails.logger.debug "Deleting Litmus test #{existing_test['id']} (#{existing_test['name']})"
        end

        body = (mail.parts.nil? || mail.parts.empty?) ? mail.body : mail.parts.last.body

        new_test = Litmus::EmailTest.create({
          :subject => mail.subject,
          :body    => body # Note that only the last part is sent
        }, mail.litmus_test)

        Rails.logger.debug "Created new Litmus test #{new_test['id']} (#{new_test['name']})"
        new_test
      end

    end
  end
end
