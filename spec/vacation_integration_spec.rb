require 'spec_helper'

describe('vacation index', :type => :feature) do
  it('shows the index page correctly') do
    visit '/'
    expect(page).to have_content('Vacationeer')
  end
end
