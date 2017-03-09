require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    User.with_writable {User.create(name: 'before', email: 'before@example.com', password: "foobar", password_confirmation: "foobar")}
  end

  it 'name test' do
      User.with_writable {User.create(name:'aaab', email:'aaa@gmail.xx', password: "foobar", password_confirmation: "foobar")}
      user = User.find_by_name("aaab")
      expect(user.name).to eq('aaab')
  end

  it 'valid user test' do
    user = User.new(name:'asdf', email:'aa@ll.com', password: "foobar", password_confirmation: "foobar")
    expect(user.valid?).to eq(true)
  end

  it 'not null name' do
    user = User.new(name:'' ,email:'aas@sd.co', password: "foobar", password_confirmation: "foobar")
    expect(user.valid?).to eq(false)
  end

  it 'not null email' do
    user = User.new(name:'nnn' ,email:'', password: "foobar", password_confirmation: "foobar")
    expect(user.valid?).to eq(false)
  end

  it 'name length test' do
    user = User.new(name: "a"*51, email:'aaa@aaa', password: "foobar", password_confirmation: "foobar")
    expect(user.valid?).to eq(false)
  end

  it 'email length test' do
    user = User.new(name: "a"*50, email:'a'*244+'@example.com')
    expect(user.valid?).to eq(false)
  end

  it 'valid email format validation' do
    user = User.new(name: 'aaa', password: "foobar", password_confirmation: "foobar")
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_email|
      user.email = valid_email
      expect(user.valid?).to eq(true)
    end
  end

  it 'invalid email format validation' do
    user = User.new(name: 'aaa', password: "foobar", password_confirmation: "foobar")
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com
                        foo@bar.baz..com]
    valid_addresses.each do |valid_email|
      user.email = valid_email
      expect(user.valid?).to eq(false)
    end
  end

  it 'password is not blank space' do
    user = User.new(name: 'aaa', password: "foobar", password_confirmation: "foobar")
    user.password = user.password_confirmation = " " * 6
    expect(user.valid?).to eq(false)
  end

  it 'password is too short' do
    user = User.new(name: 'aaa', password: "foobar", password_confirmation: "foobar")
    user.password = user.password_confirmation = "a" * 5
    expect(user.valid?).to eq(false)
  end
end
