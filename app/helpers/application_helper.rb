module ApplicationHelper
  def transform_for_select(object, index, text)
    object.collect {|o| [ o[text], o[index] ]}
  end

  def active_menu(controller_name, find)
    if find.class.name === 'Array'
      return ( find.index(controller_name) )? 'active' : ''
    end
    ( controller_name === find )? 'active' : ''
  end

  def coin_color(number)
    ( number >= 0 )? 'success' : 'alert'
  end

end
