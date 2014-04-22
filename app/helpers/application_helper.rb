module ApplicationHelper
  def transform_for_select(object, index, text)
    object.collect {|o| [ o[text], o[index] ]}
  end
end
