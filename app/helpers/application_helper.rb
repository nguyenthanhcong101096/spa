module ApplicationHelper
  def current_tab(ele_value, current)
    ele_value == current ? "active" : ""
  end
end
