RSpec.describe Lotr::Sdk::Client do

  it "requires a key" do
    expect{Lotr::Sdk::Client.new}.to raise_error(ArgumentError)
  end

  it "creates a client" do
    expect(Lotr::Sdk::Client.new('fake_key')).to be_a(Lotr::Sdk::Client)
  end

  describe 'with mocked requests', :vcr do
    before(:each) do
      @client = Lotr::Sdk::Client.new('real_key')
    end

    it "exposes 401 with a bad key" do
      bad_client = Lotr::Sdk::Client.new('fake_key')
      expect(bad_client.movie_list.error[:error_code]).to eq(401)
    end

    describe 'movies' do
      it "gets movie_list" do
        expect(@client.movie_list.data[0]['_id']).not_to be_nil
      end
      it "gets single movie by id" do
        expect(@client.movie(id:'5cd95395de30eff6ebccde56').meta[:total_count]).to eq(1)
      end
    end

    describe 'books' do
      it "gets book_list" do
        expect(@client.book_list.data[0]['_id']).not_to be_nil
      end
      it "gets single book by id" do
        expect(@client.book(id:'5cf5805fb53e011a64671582').meta[:total_count]).to eq(1)
      end
    end

    describe 'quotes' do
      it "gets quote_list" do
        expect(@client.quote_list.data[0]['_id']).not_to be_nil
      end
      it "gets single quote by id" do
        expect(@client.quote(id:'5cd96e05de30eff6ebcce7e9').meta[:total_count]).to eq(1)
      end
    end

    describe 'characters' do
      it "gets character_list" do
        expect(@client.character_list.data[0]['_id']).not_to be_nil
      end
      it "gets single character by id" do
        expect(@client.character(id:'5cd99d4bde30eff6ebccfbbe').meta[:total_count]).to eq(1)
      end
    end
  end

end
