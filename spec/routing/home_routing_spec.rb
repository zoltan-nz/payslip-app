require 'spec_helper'

describe HomeController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/').to route_to('home#index')
    end

  end
end
