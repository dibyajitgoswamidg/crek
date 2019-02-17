= Crek -- Stream parser for large Excel(xlsx and xlsm) files.

Crek is a Ruby gem that provide a fast, simple and efficient method of parsing large Excel(xlsx and xlsm) files.


== Installation

Crek can be used from the command line or as part of a Ruby web framework. To install the gem using terminal, run the following command:

    gem install Crek

To use it in Rails, add this line to your Gemfile:

    gem "Crek"


== Basic Usage
Crek can simply parse an Excel file by looping through the rows enumerator:

    require 'Crek'
    Crek = Crek::Book.new "specs/fixtures/sample.xlsx"
    sheet= Crek.sheets[0]

    sheet.rows.each do |row|
      puts row # => {"A1"=>"Content 1", "B1"=>nil, C1"=>nil, "D1"=>"Content 3"}
    end


    sheet.rows_with_meta_data.each do |row|
      puts row # => {"collapsed"=>"false", "customFormat"=>"false", "customHeight"=>"true", "hidden"=>"false", "ht"=>"12.1", "outlineLevel"=>"0", "r"=>"1", "cells"=>{"A1"=>"Content 1", "B1"=>nil, C1"=>nil, "D1"=>"Content 3"}}
    end


    sheet.state   # => 'visible'
    sheet.name    # => 'Sheet1'
    sheet.rid     # => 'rId2'

== Filename considerations
By default, Crek will ensure that the file extension is either *.xlsx or *.xlsm, but this check can be circumvented as needed:

    path = 'sample-as-zip.zip'
    Crek::Book.new path, :check_file_extension => false

By default, the Rails {file_field_tag}[http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-file_field_tag] uploads to a temporary location and stores the original filename with the StringIO object. (See {this section}[http://guides.rubyonrails.org/form_helpers.html#uploading-files] of the Rails Guides for more information.)

Crek can parse this directly without the need for file upload gems such as Carrierwave or Paperclip by passing the original filename as an option:

    # Import endpoint in Rails controller
    def import
      file = params[:file]
      Crek::Book.new file.path, check_file_extension: false
    end

== Contributing

Contributions are welcomed. You can fork a repository, add your code changes to the forked branch, ensure all existing unit tests pass, create new unit tests cover your new changes and finally create a pull request.

After forking and then cloning the repository locally, install Bundler and then use it
to install the development gem dependecies:

    gem install bundler
    bundle install

Once this is complete, you should be able to run the test suite:

    rake


== Bug Reporting

Please use the {Issues}[https://github.com/dibyajitgoswamidg/crek/issues] page to report bugs or suggest new enhancements.


== License

Crek has been published under {MIT License}[https://github.com/dibyajitgoswamidg/crek/blob/master/LICENSE.txt]
