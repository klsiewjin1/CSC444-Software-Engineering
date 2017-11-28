$(".users.edit").ready ->
  #hideInputs
  
hideInputs = ->
  inputs = document.getElementsByTagName('input')
  
  i = 0
  while i < inputs.length
    hideInput inputs[i]
    i++
  
hideInput = (input) ->
  input.style.display = 'none'