require 'roo'

my_excel = Roo::Spreadsheet.open('./Book1.xlsx')

puts my_excel.info

