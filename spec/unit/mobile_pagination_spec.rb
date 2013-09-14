require 'spec_helper'

describe MobilePagination do

  describe 'Configuration' do

    it 'page_key config defaults to page' do
      config = described_class.configuration
      expect(config.page_key).to eq('page')
    end


    it 'sets configuration options' do
      MobilePagination.configure { |config| config.page_key = 'slide' }
      expect(described_class.configuration.page_key).to eq('slide')
    end

  end

end