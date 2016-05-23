class User < ActiveRecord::Base
  validates :name, :username, presence: true, length: { minimum: 2, maximum: 40 }
  validates :username, uniqueness: true
  has_secure_password

  # override to_json
  def to_json(options={})
   options[:except] ||= [:password_digest]
   super(options)
  end
end
