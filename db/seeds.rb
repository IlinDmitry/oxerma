[
    'ООО',
    'ОАО',
    'ЗАО',
    'УП',
    'ТОО',
    'Нек. орг.',
    'Общ. орг.',
    'Фонд',
    'Гос. корп.',
    'ИП',
    'АО',
    'ПАО',
    'Другое',
].each do |name|
  begin
    OrganizationType.create! name: name
  rescue ActiveRecord::RecordInvalid => e
    puts "OrganizationType (#{name}): #{e.message}"
  end
end