require 'csv'

work_csv_text = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))
work_csv = CSV.parse(work_csv_text, headers: true)

work_csv.each do |row|
    w = Work.new
    w.type = row['category']
    w.title = row['title']
    w.creator = row['creator']
    w.published_year = row['published_year']
    w.description = row['description']
    w.save
end
