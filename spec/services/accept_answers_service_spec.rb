require 'rails_helper'

RSpec.describe AcceptAnswersService do
  describe '#call' do
    subject { service.call }

    let(:service) { described_class.new(test_passage, user_answers) }
    let!(:test_passage) { create :test_passage, user: user, test: test, current_question: question1 }
    let(:user) { create :user }
    let(:test) { create :test }
    let(:question1) { create :question, test: test }
    let!(:question2) { create :question, test: test }
    let!(:answer1) { create :answer, question: question1, correct: true }
    let!(:answer2) { create :answer, question: question1 }
    let(:user_answers) { [answer1] }

    it 'returns progress percent' do
      expect(subject).to eq(50)
    end

    it 'sets current question to the next question in test' do
      expect { subject }.to(change { test_passage.current_question }.from(question1).to(question2))
    end

    it 'increments correct questions count' do
      expect { subject }.to(change { test_passage.correct_questions }.from(0).to(1))
    end

    context 'when current question is last in test' do
      before { question2.destroy }

      it 'sets current question to the nil' do
        expect { subject }.to(change { test_passage.current_question }.from(question1).to(nil))
      end
    end

    context 'when user answered incorrectly' do
      let(:user_answers) { [answer2] }

      it 'does not increment correct questions count' do
        expect { subject }.to_not(change { test_passage.correct_questions })
      end
    end
  end
end
