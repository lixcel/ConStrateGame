ActiveAdmin.register Post do
  permit_params :title, :body, :rate, :kind

  filter :title
  filter :kind

  index do
    selectable_column
    column(:id)
    column(:user_id)
    column(:title)
    column(:body)
    column(:kind) do |post|
      post.kind_i18n
    end
    column(:created_at)
    column(:updated_at)
    actions
  end

  show do
    attributes_table do
      row(:user_id)
      row(:title)
      row(:body)
      row(:kind) do |post|
        post.kind_i18n
      end
      row(:tag_id)
      row(:created_at)
      row(:updated_at)
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :kind, as: :select, collection: Post.kinds_i18n.invert
    end
    f.actions
  end



end
