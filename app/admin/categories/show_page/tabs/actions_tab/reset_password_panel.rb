module ResetPasswordPanel
  def panel_code
    panel 'Reset Password' do
      div do
        h4 do
          'This action will generate temporay password in order to let user sign in'
        end

        span do
          link_to(
            "Reset Password for #{category.name}",
            '/',
            rel: 'nofollow',
            method: :put,
            class: 'button'
          )
        end
      end
    end
  end

  def self.extended(base)
    base.instance_eval(&:panel_code)
  end
end
