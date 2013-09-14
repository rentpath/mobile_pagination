require 'spec_helper'

module MobilePagination
  describe Paginate do

    describe 'attributes' do
       before do
        @klass = described_class.new({})
      end

      it 'should set reasonable defaults' do
        expect(@klass.total_pages).to eq 0
        expect(@klass.current_page).to eq 0
        expect(@klass.query_params).to eq({})
        expect(@klass.path).to eq "/"
      end
    end

    describe 'readers' do
      before do
        opts = {
          :total_pages  => 0,
          :current_page => 0,
          :query_params => 'a=1&b=2',
          :path         => '/abc/'
        }
        @klass = described_class.new(opts)
      end

      it 'should assign properties' do
        expect(@klass.total_pages).to eq 0
        expect(@klass.current_page).to eq 0
        expect(@klass.query_params).to eq({})
        expect(@klass.path).to eq "/abc/"
      end
    end

    describe '#first_page_link' do
    end

    describe '#previous_page_link' do
    end

    describe '#next_page_link' do
    end

    describe '#last_page_link' do
    end

  end
end