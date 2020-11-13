# frozen_string_literal: true

# Rake::Task["db:fixtures:load"].execute
# Rake::Task["bootcamp:statistics:save_learning_minute_statistics"].execute

n  = 1
start_id = Notification.count.zero? ? 0 : Notification.last.id

machida = User.find_by(login_name: "machida")
komagata = User.find_by(login_name: "komagata")
sotugyou = User.find_by(login_name: "sotugyou")

n.times do |diff|
  id = start_id + diff
  kind = 0
  user_id = sotugyou.id
  sender = komagata
  # p user_id
  # p komagata.id
  message = "message"
  path = "reports/1002957498"
  path = "reports/583973634"
  read = false
  Notification.create!(kind: kind, user_id: user_id, sender: sender, message: message, path: path, read: read)
end
