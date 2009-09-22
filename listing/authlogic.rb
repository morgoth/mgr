class User < ActiveRecord::Base
  acts_as_authentic
end

class UserSession < Authlogic::Session::Base
end

# proces logowania
session = UserSession.create(:login => "johndoe",
                             :password => "secret")
# podtrzymywanie sesji pomiędzy żądaniami
session = UserSession.find
# proces wylogowania
session.destroy