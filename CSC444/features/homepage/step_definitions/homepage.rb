Given("I am not logged in") do
    current_user = nil
end

Given("I am on the homepage") do
    visit "/"
end

Then("I should see the navbar") do
  	page.has_content?("login")
  	page.has_content?("home")
  	page.has_content?("my jobs")
  	page.has_content?("browse jobs")
end

Then("I should see the title and subtitles") do
	page.has_content?("This is Teender")
    page.has_content?("fast")
	page.has_content?("reliable")
    page.has_content?("easy")
end

Then("I should be able to login") do
	page.has_content?("NEW USER? SIGN UP!")
end