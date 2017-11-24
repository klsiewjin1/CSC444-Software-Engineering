currentTab = 0
initDone = 0

$(".users.new").ready ->
  # Show the currentTab, i.e. the first tab
  showTab currentTab
  
init = ->
  if initDone
    return
  
  # Get list of inputs
  inputs = document.getElementsByTagName('input')
  i = 0
  
  # Assign validation checks to all inputs
  while i < inputs.length
    inputs[i].setAttribute("onblur", "validateInput(this)")
    i++
    
  initDone = 1
  
showTab = (tab) ->
  
  init()
  
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
    toggleSubmit()
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
  emailRegex = /// ^
    ([\w.-]+)         # one or more letters, numbers, _ . or -
    @                 # @ sign
    ([\w.-]+)         # one or more letters, numbers, _ . or -
    \.                # a period
    ([a-zA-Z.]{2,6})  # 2 to 6 letters or periods
    $ ///i            
   
  phoneRegex = /// ^
    [0-9]{10,}
    $ ///i
    
  addressRegex = /// ^
    ([0-9]+)      # One or more number
    \s            # Followed by whitespace
    ([a-z\s]+)    # One or more letters and whitespace
    $ ///i
    
  lettersRegex = /// ^
    [a-z\s.]{2,}   # 2 or more letters, whitespace or .
    $ ///i
    
  pcodeRegex = /// ^
    [0-9a-z]{3}   # 3 letters or numbers
    \s?           # Optional whitespace
    [0-9a-z]{2,3} # 2 to 3 more letters or numbers
    $ ///i
   
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
  else if input.type == 'tel'
    regex = phoneRegex
  else if input.id == 'user_address'
    regex = addressRegex
  else if input.id == 'user_city' or input.id == 'user_state' or input.id == 'user_country' or input.id == 'user_fname' or input.id == 'user_lname'
    regex = lettersRegex
  else if input.id == 'user_pcode'
    regex = pcodeRegex
  else
    regex = emptyRegex
  
  # Check the regex for validity
  if input.value.match regex
    valid = true
    
  # Get the ID of the associated error text field
  errorText = document.getElementById("error_" + input.id)
    
  if valid and match
    input.className = 'input valid'
    errorText.innerHTML = ""
    valid = true
  else
    input.className = 'input invalid'
    errorText.innerHTML = errorText.getAttribute('error')
    valid = false
  
  if (currentTab == (document.getElementsByClassName('tab').length-1))
    toggleSubmit()
    
  return valid
  
    
matchConfirmations = (input, entry, confirmation) ->
  if input == entry
    return input.value.match confirmation.value
  else if input == confirmation
    return validateInput(entry) and input.value.match entry.value
  else
    return false
    
@toggleSubmit = ->
  if ((document.getElementById('user_password').className == 'input valid') and (document.getElementById('user_password_confirmation').className == 'input valid'))
    document.getElementById('submitBtnFake').style.display = 'none'
    document.getElementById('submitBtn').style.display = 'inline'
  else
    document.getElementById('submitBtn').style.display = 'none'
    document.getElementById('submitBtnFake').style.display = 'inline'
