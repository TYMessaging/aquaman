RSpec.shared_context 'shared', shared_context: :metadata do
  let(:base_url) { FFaker::Internet.http_url }
  let(:http_headers) do
    {
      'Accept' => 'text/css,*/*;q=0.1',
      'Accept-Encoding' => 'gzip, deflate, br',
      'Accept-Language' => 'en',
    }
  end

  let(:query_string) do
    {
      fruit: FFaker::Food.fruit,
      meat: FFaker::Food.meat,
      herb_or_spice: FFaker::Food.herb_or_spice,
    }.with_indifferent_access
  end

  let(:request_body) { FFaker::Lorem.characters }
end
