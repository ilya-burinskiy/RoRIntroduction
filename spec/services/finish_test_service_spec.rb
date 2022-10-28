require 'rails_helper'

RSpec.describe FinishTestService do
  describe '#call' do
    subject { service.call }

    let(:service) { described_class.new(test_passage) }
    # TODO: Make a trait for test passage with current_question set to nil
    let!(:test_passage) do
      create :test_passage, test: test,
                            correct_questions: correct_questions,
                            current_question: nil
    end
    let(:test) { create :test }
    # Sum of all correct answers for question1 and question2
    let(:correct_questions) { 2 } 
    let!(:question1) { create :question, test: test }
    let!(:question2) { create :question, test: test }
    let!(:answer1) { create :answer, correct: true, question: question1 }
    let!(:answer2) { create :answer, question: question1 }
    let!(:answer3) { create :answer, correct: true, question: question2 }
    let!(:answer4) { create :answer, question: question2 }

    it 'marks test passage as passed' do
      subject
      expect(test_passage.passed).to be_truthy
    end

    it 'mails user' do
      expect(TestsMailer).to receive(:completed_test).and_call_original
      subject
    end

    it 'calls for badge service' do
      expect(BadgeDepartment::BadgeService).to receive(:call).and_call_original
      subject
    end

    it 'returns passage percent' do
      expect(subject).to eq(100)
    end

    context 'when the user did not get the required number of correct answers' do
      let(:correct_questions) { 0 }

      it 'marks test passage as failed' do
        subject
        expect(test_passage.passed).to be_falsey
      end
    end
  end
end
