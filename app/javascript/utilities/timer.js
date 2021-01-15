document.addEventListener('turbolinks:load', function() {
  const timerBlock = document.querySelector('.timer')

  if (timerBlock) { startTimer(timerBlock) }
})

function startTimer(timerBlock) {
  let timeLeft = parseInt(timerBlock.dataset.timeLeft)

  setInterval(() => {
    let minutes = parseInt(timeLeft / 60, 10)
    let seconds = parseInt(timeLeft % 60, 10)

    minutes = minutes < 10 ? '0' + minutes : minutes
    seconds = seconds < 10 ? '0' + seconds : seconds

    timerBlock.textContent = minutes + ':' + seconds

    if (--timeLeft < 0) {
      const form = document.querySelector('form')
      form.submit()
    }
  }, 1000);
}
