describe Fastlane::Actions::VeepioAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The veepio plugin is working!")

      Fastlane::Actions::VeepioAction.run(nil)
    end
  end
end
