module EmployeesHelper

  def table_header
    table_header = (controller_name.classify.constantize.new.attributes.keys - ['created_at', 'updated_at']).map! {|key| key.titleize}
    table_header << 'Actions'
  end

  def table_lines(line)
    fields = []
    line.attributes.keys do |key|
      fields << line.try(key)
    end
    fields
  end

end
