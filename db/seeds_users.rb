users = ["natalia.panferova.pro@gmail.com", "manuuzkudun@gmail.com", "jm27746@gmail.com",
"fred.sanches@gmail.com"]


users.each do |user|
  User.create(email:user, password:"123456", last_seen: Time.now.utc.strftime("%Y%m%d%H%M%S"))
end
