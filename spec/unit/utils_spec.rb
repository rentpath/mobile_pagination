require 'spec_helper'

module MobilePagination
  describe 'Utils' do
    include Utils

    it '#query_to_hash should covert query to hash' do
      expectation = query_to_hash('a=1&b=2')
      expect(expectation).to eq({'a' => '1', 'b' => '2'})
    end

    it '#hash_to_query should covert hash to query' do
      expectation = hash_to_query({ :a => 1, :b => 2})
      expect(expectation).to eq('a=1&b=2')
    end

  end
end