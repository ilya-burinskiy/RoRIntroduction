module QuestionsHelper

  MODS = {new: 'Create New', edit: 'Edit'}.freeze

  def question_header(test_title, mode)
    MODS[mode] + ' ' + test_title + ' ' + 'Question'
  end
end
