require 'json'
require 'cgi'

def h(s)
  CGI.escapeHTML(s)
end

hash = JSON.parse(ARGF.read)
course = hash.fetch('currentCourse')

title = course.fetch('title')

puts <<-HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#{h(title)}</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <h1>#{h(title)}</h1>
HTML

course.fetch('skills').each do |row|
  row.each do |skill|
    skill_name = skill.fetch('name')
    notes = skill.fetch('tipsAndNotes')
    next unless notes
    puts <<-HTML
        <section>
          <h1>#{h(skill_name)}</h1>

          #{notes}
        </section>
    HTML
  end
end

puts <<-HTML
  </body>
</html>
HTML
