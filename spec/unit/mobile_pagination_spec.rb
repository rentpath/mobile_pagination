require 'spec_helper'

describe MobilePagination do

  describe 'Configuration' do
    it 'page config defaults to page' do
      MobilePagination.configure
      config = described_class.configuration
      expect(config.page_key).to eq('page')
    end

    it 'sets any configuration option' do
      MobilePagination.configure { |config| config.page_key = 'page' }
      expect(described_class.configuration.page_key).to eq('page')
    end
  end

end