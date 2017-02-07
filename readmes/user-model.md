## Model ##

__Migration for user table__ 

```ruby
class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, { null: false }
      t.string :email, { null: false }
      t.string :hashed_password, { null: false }

      t.timestamps(null: false)
    end
  end
end
```

__Model for user table__

```ruby
class User < ActiveRecord::Base

  validates :email, { presence: true }
  validates :email, { uniqueness: true }
  validates :email, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
  validate :check_password

  def check_password
    if @raw_password && @raw_password.length < 8
      @errors.add(:password, "needs to be 8 characters or more")
    end
  end

	def authenticated?(password)
    self.password == password
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(@raw_password)
    self.hashed_password = @password
  end

end
```
