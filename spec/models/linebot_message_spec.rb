require 'rails_helper'

RSpec.describe LinebotMessage, type: :model do
  let(:linebot_message) { LinebotMessage.new(event_message) }

  describe '#reply' do
    context "正常" do
      # before do
      #   allow(linebot_message).to receive(:estate) { nil }
      #   allow(linebot_message).to receive(:vegetable) { nil }
      #   allow(linebot_message).to receive(:fruit) { nil }
      #   allow(linebot_message).to receive(:fish) { nil }
      #   allow(linebot_message).to receive(:foods) { nil }
      #   allow(linebot_message).to receive(:drugstore) { nil }
      # end
      let!(:event_message) { 'test' }
      it do
        expect(linebot_message.reply).to eq event_message
      end
    end
    context "nil" do
      let!(:event_message) { nil }
      it do
        expect(linebot_message.reply).to eq ""
      end
    end
  end

  describe '#estate' do
    context "正常" do
      let!(:event_message) { 'estate' }
      it do
        expect(linebot_message.estate).to eq "不動産"
      end
    end
  end

  describe '#vegetable' do
    context "正常" do
      let!(:event_message) { 'vegetable' }
      it do
        expect(linebot_message.vegetable).to eq "野菜"
      end
    end
  end

  describe '#fruit' do
    context "正常" do
      let!(:event_message) { 'fruit' }
      it do
        expect(linebot_message.fruit).to eq "フルーツ"
      end
    end
  end

  describe '#fish' do
    context "正常" do
      let!(:event_message) { 'fish' }
      it do
        expect(linebot_message.fish).to eq "魚"
      end
    end
  end

  describe '#foods' do
    context "正常" do
      let!(:event_message) { 'foods' }
      it do
        expect(linebot_message.foods).to eq "食品"
      end
    end
  end

  describe '#drugstore' do
    context "正常" do
      let!(:event_message) { 'drugstore' }
      it do
        expect(linebot_message.drugstore).to eq "ドラッグストア"
      end
    end
  end

end
