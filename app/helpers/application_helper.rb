module ApplicationHelper
  def current_tab(ele_value, current)
    ele_value == current ? "active" : ""
  end

  def app_setting
    AppSetting.first
  end
end
