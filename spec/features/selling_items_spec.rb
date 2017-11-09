require "rails_helper"

RSpec.feature "users can sell items" do 
  
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

  scenario "can add to sale slip" do 
  	visit "/"

  	click_link "Sell"
  	first(:link, "Add to Order").click
  	

  end
end