module ApplicationHelper

  def dollar(amount)
    "$#{number_with_delimiter(amount, delimiter: ',')}"
  end

end
