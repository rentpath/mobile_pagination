require 'spec_helper'

module MobilePagination
  describe Paginate do

    describe 'attributes' do
       before do
        @klass = described_class.new({})
      end

      it 'should set defaults' do
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

    describe 'class methods' do
      before do
        MobilePagination.configure { |c| c.page_key = 'slide' }
        opts = {
          :total_pages  => 10,
          :current_page => 5,
          :query        => 'slide=5&community=Providence',
          :path         => '/Listings/Georgia/Atlanta/'
        }
        @klass = described_class.new(opts)
      end

      describe '#first_page_link' do
        it 'should generate url for first page' do
          expect(@klass.first_page_link).to eq('/Listings/Georgia/Atlanta/?community=Providence')
        end
      end

      describe '#previous_page_link' do
        it 'should generate url for previous page' do
          expect(@klass.previous_page_link).to eq('/Listings/Georgia/Atlanta/?slide=4&community=Providence')

        end
      end

      describe '#next_page_link' do
        it 'should generate url for next page' do
          expect(@klass.next_page_link).to eq('/Listings/Georgia/Atlanta/?slide=6&community=Providence')
        end
      end

      describe '#last_page_link' do
        it 'should generate url for last page' do
          expect(@klass.last_page_link).to eq('/Listings/Georgia/Atlanta/?slide=10&community=Providence')
        end
      end

    end

  end
end