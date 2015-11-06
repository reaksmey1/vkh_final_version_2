# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CarRepairingQuote.create(name: 'កញ្ចក់រថយន្ត៖ ប្រះ ( ) ដំុថ្មកាត់ ( ) ឆ្កូត', problem_type: "exterior of vehicle")

CarRepairingQuote.create(name: 'ផ្លឹតទឹក', problem_type: "exterior of vehicle")

CarRepairingQuote.create(name: 'ស្បែកហ្រាំង / ថាសហ្រាំង', problem_type: "exterior of vehicle")

CarRepairingQuote.create(name: 'តួរថយន្ត', problem_type: "exterior of vehicle")

CarRepairingQuote.create(name: 'ថាសកង់', problem_type: "exterior of vehicle")

CarRepairingQuote.create(name: 'ភ្លើងសញ្ញា់', problem_type: "while driving in")
CarRepairingQuote.create(name: 'ភ្លើងតាប្លួ់', problem_type: "while driving in")
CarRepairingQuote.create(name: 'ក្លិនក្នុងរថយន្ត', problem_type: "while driving in")
CarRepairingQuote.create(name: 'កំរាលជើង', problem_type: "while driving in")
CarRepairingQuote.create(name: 'ម៉ាសីុនប្រអប់លេខ ( សំលេងដំណើរការ )', problem_type: "while driving in")
CarRepairingQuote.create(name: 'ប្រព័ន្ធបាញ់ទឹកកញ្ចក់ / ទំហំុបាញ់ ( រួមបញ្ចូលទាំង ចង្កៀងបំភ្លឺខាងមុខ )', problem_type: "while driving in")

CarRepairingQuote.create(name: 'ម៉ាកេប្រេងម៉ាសុីន / ប្រេងប្រអប់លេខ', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ប្លុកម៉ាសុីន', problem_type: "engine bay")

CarRepairingQuote.create(name: 'កំរិតទឹក collant', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ប្រេងហ្រវាំង / មានជាតិទឹក', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ទឹកបាញ់កញ្ចក់រថយន្ត / បរិមាណទឹក', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ខ្សែពាន ខ្សែភ្លើង ទុយោ', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ពិនិត្រអាគុយ', problem_type: "engine bay")

CarRepairingQuote.create(name: 'ម៉ាសីុនត្រជាក់ ( ដល់ពេលកំណត់សេវាកម្មរឺនៅ ? )', problem_type: "engine bay")


CarRepairingQuote.create(name: 'ពិនិត្រកង់ ( ភាពសឹក អាយុកាល ស្តានភាពកង់ )', problem_type: "vehicle half lifted")


CarRepairingQuote.create(name: 'ការលិចរឺជ្រាប ( ម៉ាសីុន / ប្រអប់លេខ )', problem_type: "vehicle fully lifted")

CarRepairingQuote.create(name: 'បំព្ង់សីុមុាំង ( លេចធ្លុះ កៅស៊ូ )', problem_type: "vehicle fully lifted")
