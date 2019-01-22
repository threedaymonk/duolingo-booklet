# Duolingo course note booklet generator

This Ruby script will process a Duolingo course JSON file and generate an HTML
version of the full course notes.

## Obtaining the JSON

This is a little complicated, and requires some familiarity with browser
developer tools. The basic process is:

* Open the Duolingo website
* Open Web Developer tools
* Sign in
* Select the language (if appropriate)
* Look for a request that looks something like `https://www.duolingo.com/2017-06-30/users/999999?fields=fromLanguage,courses,currentCourse,learningLanguage`
* Open that link and save the raw JSON

# Generating the HTML

    $ ruby convert.rb 999999.json > output.html

A simple stylesheet is included: `style.css`.
