require 'spec_helper'

describe PayslipsController do
  describe 'routing' do

    it 'routes to #index' do

      expect(:get => '/payslips').to route_to('payslips#index')
    end

    it 'routes to #show_multiple' do
      expect(post: '/payslips/multiple').to route_to('payslips#show_multiple')
    end

  end
end
