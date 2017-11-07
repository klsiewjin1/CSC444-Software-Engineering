currentTab = 0

$(".users.new").ready ->
  tabs = document.getElementsByClassName('tab')
  showTab currentTab
  return
  
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
    
  return
  
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
  
  return
  
validateForm = ->
  tabs = document.getElementsByClassName('tab')
  inputs = tabs[currentTab].getElementsByTagName('input')
  valid = true
  
  i = 0
  while i < inputs.length
    if inputs[i].value == ''
      inputs[i].className = 'input invalid'     # Add invalid to the class name
      valid = false
      
    else if inputs[i].
    else 
      inputs[i].className = 'input valid'     # Add valid to the class name
    i++
    
  return valid
  
@validateInput = (input) ->
  if input.value == ''
    input.className = 'input invalid'
  else
    input.className = 'input valid'
    
  if validateForm
    document.getElementById('nextBtn').className = 'btn btn-primary'
  else
    document.getElementById('nextBtn').className = 'btn btn-primary disabled'