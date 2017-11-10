currentTab = 0

$(".users.new").ready ->
  # Get list of inputs
  inputs = document.getElementsByTagName('input')
  i = 0
  
  # Assign validation checks to all inputs
  while i < inputs.length
    inputs[i].setAttribute("onfocusout", "validateInput(this)")
    i++
  
  # Show the currentTab, i.e. the first tab
  showTab currentTab
  
showTab = (tab) ->
  tabs = document.getElementsByClassName('tab')
  tabs[tab].style.display = 'block'
  
  # Next/prev buttons
  if tab == 0
    document.getElementById('prevBtn').style.display = 'none'
  else
    document.getElementById('prevBtn').style.display = 'inline'
    
  # Submit/next button conditional display
  if tab == tabs.length - 1
    document.getElementById('nextBtn').style.display = 'none'
    document.getElementById('submitBtn').style.display = 'inline'
  else
    document.getElementById('submitBtn').style.display = 'none'
    document.getElementById('nextBtn').style.display = 'inline'
  
@nextPrev = (n) ->
  tabs = document.getElementsByClassName('tab')
  
  # Validate form entry before moving to next step
  if n == 1 and !validateForm()
    return false
  
  # Hide the old tab
  tabs[currentTab].style.display = 'none'
  
  currentTab = currentTab + n
  
  # If this is the end of the form
  if currentTab >= tabs.length
    document.getElementById('registrationForm').submit
    return false
  
  # Show the new tab
  showTab currentTab
  
validateForm = ->
  tabs = document.getElementsByClassName('tab')
  inputs = tabs[currentTab].getElementsByTagName('input')
  valid = true
  i = 0
  
  # Validate every input on the current tab. Return false is any invalid.
  while i < inputs.length
    if !validateInput(inputs[i])
      valid = false
    i++
    
  return valid
    
@validateInput = (input) ->
  # Regex codes
  emailRegex = /// ^ #begin of line
   ([\w.-]+)         #one or more letters, numbers, _ . or -
   @                 #followed by an @ sign
   ([\w.-]+)         #then one or more letters, numbers, _ . or -
   \.                #followed by a period
   ([a-zA-Z.]{2,6})  #followed by 2 to 6 letters or periods
   $ ///i            #end of line and ignore case
   
  emptyRegex = ///
  [-_.a-zA-Z0-9]{3,}
  ///
  
  match = true
  valid = false
   
  # Select the regex code based on the input type
  if input.type == 'email'
    regex = emailRegex
    match = matchConfirmations(input, document.getElementById('user_email'), document.getElementById('user_email_confirmation'))
  else if input.type == 'password'
    regex = emptyRegex
    match = matchConfirmations(input, document.getElementById('user_password'), document.getElementById('user_password_confirmation'))
  else
    regex = emptyRegex
  
  # Check the regex for validity
  if input.value.match regex
    valid = true
    
  if valid and match
    input.className = 'input valid'
    return true
  else
    input.className = 'input invalid'
    return false
    
matchConfirmations = (input, entry, confirmation) ->
  if input == entry
    return input.value.match confirmation.value
  else if input == confirmation
    return validateInput(entry) and input.value.match entry.value
  else
    return false