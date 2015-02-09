ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel "Recently updated restrooms" do
      table_for PaperTrail::Version.where(item_type: 'Restroom').order('id desc').limit(20) do
        column "Item", :item
        column "Modified at" do |v|
          v.created_at.to_s :long
        end
        column "Admin" do |v|
          link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] if v.whodunnit?
        end
      end
    end
  end
end
