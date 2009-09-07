User.first
# SELECT * FROM "users" LIMIT 1
User.first :conditions => { :login => "johndoe" }
# SELECT * FROM "users" WHERE
#   ("users"."login" = 'johndoe') LIMIT 1
User.find_by_login "johndoe"
# SELECT * FROM "users" WHERE
#   ("users"."login" = 'johndoe') LIMIT 1