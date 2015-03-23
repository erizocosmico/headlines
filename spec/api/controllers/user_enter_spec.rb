require 'spec_helper'

describe Api::Controllers::User::Enter do
  include SpecUtils

  before do
    @app = Api::Application.new
    Headlines::Model::UserRepository.clear
    Headlines::Model::TokenRepository.clear
  end

  after do
    Headlines::Model::UserRepository.clear
    Headlines::Model::TokenRepository.clear
  end

  describe 'when the email is not valid' do
    it 'should return status 400' do
      post_json '/user/enter', {:email => 'invalid', :password => '12345678'}

      response.status.must_equal 400
    end
  end

  describe 'when the password is not valid' do
    it 'should return status 400' do
      post_json '/user/enter', {:email => 'valid@valid.org', :password => '1234567'}

      response.status.must_equal 400
    end
  end

  describe 'when the email does not exist' do
    it 'should return status 200 and the json with the token and the expiration' do
      post_json '/user/enter', {:email => 'valid@valid.org', :password => '12345678'}

      response.status.must_equal 200
      resp = JSON.parse(response.body)
      resp["success"].must_equal true
      resp["token"].length.must_be :>, 0
      resp["expiration"].must_be :>, 0
    end
  end

  describe 'when the email does exist' do
    describe 'and the password is not valid' do
      before do
        Headlines::Model::UserRepository.persist(Headlines::Model::User.new(email: 'valid@taken.org', password: '12345678'))
      end

      it 'should return status 401' do
        post_json '/user/enter', {:email => 'valid@taken.org', :password => '12345679'}

        response.status.must_equal 401
      end
    end

    describe 'and the password is valid' do
      it 'should return status 200 and the json with the token and the expiration' do
        post_json '/user/enter', {:email => 'valid@valid.org', :password => '12345678'}

        response.status.must_equal 200
        resp = JSON.parse(response.body)
        resp["success"].must_equal true
        resp["token"].length.must_be :>, 0
        resp["expiration"].must_be :>, 0
      end
    end
  end
end