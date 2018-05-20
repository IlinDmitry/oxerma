namespace :vcs do
  desc "Добавление upstream репозитория"
  task add_upstream: :environment do
    puts 'Добавление upstream репозитория'
    sh 'git remote add upstream git@github.com:oxerma/oxerma.git'
  end

  desc "Обновление состояния fork репозитория"
  task update: :environment do
    puts '[*] Получение обновлений upstream репозитория'
    sh 'git fetch upstream'
    puts '[*] Выполнение перебазирования ветки'
    sh 'git rebase upstream/master'
    puts '[*] Применение изменений в fork репозитории'
    sh 'git push origin master'
  end
end
