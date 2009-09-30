class StudentImport < ActiveRecord::Base
  require "yaml"

  before_save :parse_file

  def parse_file
    users = YAML::load(file)
    users.each do |attributes|
      Student.create attributes
    end
  end
end
