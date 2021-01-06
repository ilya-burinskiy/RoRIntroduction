document.addEventListener('turbolinks:load', function() {
  const password = document.getElementById('user_password')
  const passwordConfirmation = document.getElementById('user_password_confirmation')

  if (password && passwordConfirmation) {
    password.addEventListener('input', checkPassword)
    passwordConfirmation.addEventListener('input', checkPasswordConfirmation)
  }
})

function checkPassword() {
  const passwordConfirmation = document.getElementById('user_password_confirmation')

  if (this.value && passwordConfirmation.value) {
    this.value == passwordConfirmation.value ? passwordMatch() : passwordMismatch()
  } else {
    hideMessage()
  }
}

function checkPasswordConfirmation(params) {
  const password = document.getElementById('user_password')
  
  if (this.value && password.value) {
    this.value == password.value ? passwordMatch() : passwordMismatch()
  } else {
    hideMessage()
  }
}

function hideMessage() {
  const message = document.querySelector('.message')
  message.classList.add('hide')
}

function passwordMatch() {
  const message = document.querySelector('.message')
  message.textContent = 'Passwords match'
  message.classList.remove('message-mismatch')
  message.classList.add('message-match')
  message.classList.remove('hide')
}

function passwordMismatch() {
  const message = document.querySelector('.message')
  message.textContent = 'Passwords mismatch'
  message.classList.remove('message-match')
  message.classList.add('message-mismatch')
  message.classList.remove('hide')
}
