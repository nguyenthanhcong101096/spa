module ActionsTab
  def action_tab_code
    tab 'Actions' do
      show_widget :panel, 'ResetPassword'
    end
  end

  def self.extended(base)
    base.instance_eval(&:action_tab_code)
  end
end
