class Email
  include ActiveModel::Model

  attr_accessor :name, :addr, :message

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :addr, :presence => {:message => 'メールアドレスを入力してください'}
end
