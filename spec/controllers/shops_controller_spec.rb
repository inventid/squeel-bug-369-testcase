# You might be wondering why we put so many swag in some tests?
# Actually the Faker library can generate the same words, causing
# `.to_noq eq()` to match the words (since on generation it user
# the exact same word). By adding something stupid we ensure that
# that condition cannot occur.
describe ShopsController do

  before do
    load "#{Rails.root}/db/seeds.rb"
    @shop = Shop.first
    @session = Session.create user: User.first
    @request.env['X-Session-Token'] = @session.token
  end

  describe '#index' do
    render_views

    it 'should return information about all shops I crew as an event user', failure: true do
      user = @session.user
      event = Event.first

      AccessRight.create accessible: event, user: user

      get :index, user_id: user.id, format: :json
      expect(response.status).to eq(200) # OK
      parsed = JSON.parse(response.body)
      expect(parsed.size).to eq(1)
    end

    it 'should return information about all shops I crew as an organization user', failure: true do
      user = @session.user
      organization = Organization.first

      AccessRight.create accessible: organization, user: user

      get :index, user_id: user.id, format: :json
      expect(response.status).to eq(200) # OK
      parsed = JSON.parse(response.body)
      expect(parsed.size).to eq(1)
    end

    it 'should return information about all shops I crew as a shop user' do
      user = @session.user
      shop = Shop.first

      AccessRight.create accessible: shop, user: user

      get :index, user_id: user.id, format: :json
      expect(response.status).to eq(200) # OK
      parsed = JSON.parse(response.body)
      expect(parsed.size).to eq(1)
    end

    it 'should return information about all shops I crew as a shop user when I crew none' do
      get :index, user_id: @session.user.id, format: :json
      expect(response.status).to eq(200) # OK
      parsed = JSON.parse(response.body)
      expect(parsed.size).to eq(0)
    end

    it 'should return information about all shops' do
      user = @session.user
      shop = Shop.first

      AccessRight.create accessible: shop, user: user

      get :index, format: :json
      expect(response.status).to eq(200) # OK
      parsed = JSON.parse(response.body)
      expect(parsed.size).to eq(1)
    end


  end

end
