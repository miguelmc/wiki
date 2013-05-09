module ApplicationHelper

  def rest(array)
    _,*rest = array
    rest
  end
end
