require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it { should validate_presence_of(:username) }
    it "should validate presence of password_digest"
    it "should validate uniqueness of session token"
    it "should validate presence of session token"
    it "should validate length of password"
    it "allow password to be nil"
  end

  describe "class methods" do
    describe "::find_by_credentials"
      it "should find the user with right credentials"
    describe "is_password?"
    describe "::generate_session_token"
    describe "password"
    describe "password="
    describe "ensure_session_token"
    describe "reset_session_token!"
  end
end
