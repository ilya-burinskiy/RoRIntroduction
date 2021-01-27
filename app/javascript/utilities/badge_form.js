document.addEventListener('turbolinks:load', function() {
  let badge_rule = document.getElementById('badge_rule')
  
  if (badge_rule) {
    badge_rule.addEventListener('input', showBadgeRuleOptions)
  }
})

function showBadgeRuleOptions() {
  let test_input = document.querySelector('.test-input')
  let category_input = document.querySelector('.category-input')
  let level_input = document.querySelector('.level-input')

  switch (this.value) {
    case "passing_test_on_first_try":
      test_input.classList.remove('hide')

      if (!category_input.classList.contains('hide')) {
        category_input.classList.add('hide')
      }

      if (!level_input.classList.contains('hide')) {
        level_input.classList.add('hide')
      }      
      break;
  
    case "passing_all_tests_from_category":
      category_input.classList.remove('hide')

      if (!test_input.classList.contains('hide')) {
        test_input.classList.add('hide')
      }

      if (!level_input.classList.contains('hide')) {
        level_input.classList.add('hide')
      }
      break;

    case "passing_all_tests_by_level":
      level_input.classList.remove('hide')

      if (!test_input.classList.contains('hide')) {
        test_input.classList.add('hide')
      }

      if (!category_input.classList.contains('hide')) {
        category_input.classList.add('hide')
      }
      break;

    default:
      break;
  }
}
