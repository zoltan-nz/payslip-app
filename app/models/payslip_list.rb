class PayslipList

  include ActiveModel::Model
  attr_accessor :payslip_start_date, :payslip_end_date, :employee_ids
  attr_reader :all


  def initialize(attributes={})
    super
    if self.valid?
      @employees              = Employee.find(@employee_ids)
      @all                    = collection
    end
  end

  validates :payslip_start_date, :payslip_end_date, :employee_ids, presence: true

  def collection
    collection = []
    @employees.each do |employee|
      payslip = Payslip.new(employee: employee, pay_period_start_date: @payslip_start_date, pay_period_end_date: @payslip_end_date )
      if payslip.errors.any?
        errors.add(:payslip_end_date, payslip.errors.full_messages)
      else
        collection << payslip
      end
    end
    collection
  end

  def params_for_csv
    {employee_ids: @employees.map(&:id), payslip_end_date: @payslip_start_date, payslip_start_date: @payslip_end_date}
  end

  private

end


