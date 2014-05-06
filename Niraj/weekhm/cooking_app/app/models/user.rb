class User < ActiveRecord::Base
  
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :email, presence: true
  validates :email, uniqueness: true

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end


# [2] pry(main)> u = User.first
#   User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT 1
# => #<User id: 1, email: "nirajvyas28@hotmail.com", password_digest: "$2a$10$Z0NQWvE./z83xT.n3vKzDeB24DE9dEcfUgrva9veGvsh...", created_at: "2014-04-22 10:35:55", updated_at: "2014-04-22 14:06:35", role: "admin">
# [3] pry(main)> u
# => #<User id: 1, email: "nirajvyas28@hotmail.com", password_digest: "$2a$10$Z0NQWvE./z83xT.n3vKzDeB24DE9dEcfUgrva9veGvsh...", created_at: "2014-04-22 10:35:55", updated_at: "2014-04-22 14:06:35", role: "admin">
# [4] pry(main)> u.role = 'admin'
# => "admin"
# [5] pry(main)> u.save
#    (0.1ms)  begin transaction
#   User Exists (0.1ms)  SELECT 1 AS one FROM "users" WHERE ("users"."email" = 'nirajvyas28@hotmail.com' AND "users"."id" != 1) LIMIT 1
#    (0.0ms)  commit transaction
# => true
# [6] pry(main)> u.role = :admin
# => :admin
# [7] pry(main)> u.save