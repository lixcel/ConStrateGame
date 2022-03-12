ActiveAdmin.register User do
permit_params :nickname, :email, :password, :introduction, :image

end
