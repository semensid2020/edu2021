# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

p1 = Predmet.create(name: 'Английский яз.', description: 'Английский язык для начинающих')
p1.book.attach(io: File.open("app/assets/books/book1_english.pdf"), filename: "book1_english.pdf", content_type: "application/pdf")

p2 = Predmet.create(name: 'Французкий яз.', description: 'Французский язык для начинающих')
p2.book.attach(io: File.open("app/assets/books/book2_french.pdf"), filename: "book2_french.pdf", content_type: "application/pdf")

Predmet.create(name: 'Программирование', description: 'Программирование индивидуальн.')
Predmet.create(name: 'Математика', description: 'Алгебра и геометрия 9 - 11 кл')
Predmet.create(name: 'Художественная обработка', description: 'Художественная обработка дерева и металлов')

Role.create(name: admin)
Role.create(name: teacher)
Role.create(name: student)
