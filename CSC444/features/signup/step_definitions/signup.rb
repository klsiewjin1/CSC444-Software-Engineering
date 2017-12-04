Given("that I am on the homepage") do
    visit "/"
end

Given("I see the signup button") do
    page.has_content?("NEW USER? SIGN UP!")
end

When("I click on the signup button") do
    click_on(class: 'button')
end

Then("I should see the form to enter a username") do
    page.has_content?("pick a unique username")
end

When("I enter a username, bo, that has less than three characters") do
    # within(class: 'Username') do
    #   fill_in :username , :with => 'Jimmy'
    # end
    pending
end

Then("I should see a error message to create a username with more than three characters") do
    pending
    #page.has_content?("Please pick a unique username with 3+ characters")
end