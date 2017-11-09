require "rails_helper"

RSpec.feature "users can:" do 
  before do
    FactoryBot.create(:item, 
                          name: "spanner",
                          partno: "spn1234",
                          price: 200.5,
                          quantity: 27 )
    FactoryBot.create(:item, 
                          name: "jack",
                          partno: "jk1234",
                          price: 1400,
                          quantity: 7 )
  end

  scenario "view items" do 
  	visit "/"

  	click_link "items"

  	expect(page).to have_content "spanner"
  	expect(page).to have_content "jack"
  end
end