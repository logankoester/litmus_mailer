require 'rubygems'
require 'litmus'
require 'action_mailer'

require File.join( File.dirname(__FILE__), 'litmus_mailer', 'settings' )
require File.join( File.dirname(__FILE__), 'litmus_mailer', 'mail_observer' )

module ActionMailer
  class Base
    alias :mail_without_litmus :mail

    def mail(headers={}, &block)
      result = mail_without_litmus(headers, &block)
      mailer = self.class.name.to_s
      action = caller[0][/`.*'/][1..-2].sub('block in ', '').to_s
      result.class.instance_eval do
        define_method(:litmus_test) { "#{LitmusMailer::Config.test_name_prefix}#{mailer}-#{action}" }
      end
    end
  end
end

ActionMailer::Base.register_observer(LitmusMailer::MailObserver)
