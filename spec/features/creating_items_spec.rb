require "rails_helper"

RSpec.feature "users can create items" do 

  scenario "successfully" do 
  	visit "/"
  	click_link "items"
  	click_link "New Item"
  	fill_in "Name", with: "spanner"
  	fill_in "Part no:", with: "s1234"
  	fill_in "Price", with: "200"
  	fill_in "Quantity", with: "20"
  	click_button "Create Item"

  	expect(page).to have_content "Item Created Successfully."
  end
end