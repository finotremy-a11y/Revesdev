# Create the admin user (idempotent: won't create a duplicate if already exists)
admin_email    = ENV.fetch("ADMIN_EMAIL", "admin@revesdev.fr")
admin_password = ENV.fetch("ADMIN_PASSWORD", "changeme123!")

User.find_or_create_by!(email_address: admin_email) do |user|
  user.password = admin_password
  user.password_confirmation = admin_password
  puts "✅ Admin user created: #{admin_email}"
end
