require 'rails_helper'

RSpec.describe StartTestService do
  describe '#call' do
    subject { described_class.new(user, test).call }

    let(:user) { create :user }
    let(:test) { create :test }
    let!(:question) { create :question, test: test }

    it 'creates test passage' do
      expect { subject }.to(change { TestPassage.count }.by(1))
    end
  end
end
