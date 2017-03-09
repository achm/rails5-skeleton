require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    User.with_writable {User.create(name: 'before', email: 'before@example.com')}
  end

  it 'name test' do
      User.with_writable {User.create(name:'aaab', email:'aaa@gmail.xx')}
      user = User.find_by_name("aaab")
      expect(user.name).to eq('aaab')
  end

  it 'valid user test' do
    user = User.new(name:'asdf', email:'aa@ll.com')
    expect(user.valid?).to eq(true)
  end

  it 'not null name' do
    user = User.new(name:'' ,email:'aas@sd.co')
    expect(user.valid?).to eq(false)
  end

  it 'not null email' do
    user = User.new(name:'nnn' ,email:'')
    expect(user.valid?).to eq(false)
  end

  it 'name length test' do
    user = User.new(name: "a"*51, email:'aaa@aaa')
    expect(user.valid?).to eq(false)
  end

  it 'email length test' do
    user = User.new(name: "a"*50, email:'a'*244+'@example.com')
    expect(user.valid?).to eq(false)
  end

  it 'valid email format validation' do
    user = User.new(name: 'aaa')
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_email|
      user.email = valid_email
      expect(user.valid?).to eq(true)
    end
  end

  it 'invalid email format validation' do
    user = User.new(name: 'aaa')
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com
                        foo@bar.baz..com]
    valid_addresses.each do |valid_email|
      user.email = valid_email
      expect(user.valid?).to eq(false)
    end
  end
end
