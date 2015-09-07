require 'spec_helper'

module Ivan
  describe Output do
    let (:display) { double(send_instructions: true) }
    let (:output) { Output.new(frame: Frame.new, display: display) }
    let (:object_1) { double }

    describe "#render" do
      it "sends :render to the frame object" do
        expect(output.frame).to receive(:render)
        output.render(nil)
      end
    end

    describe "#send_to_display" do
      context "when it has instructions in the frame" do
        it "sends instructions to display" do
          output.render(object_1)
          expect(output.display).to receive(:send_instructions).at_least(:once)
          output.send_to_display
        end
      end
    end

    describe "#clear" do
      it "clears the frame" do
        expect(output.frame).to receive(:clear)
        output.clear
      end
    end
  end
end