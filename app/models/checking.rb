class Checking < ApplicationRecord
  belongs_to :user
  has_one_attached :studentwork
end


# def add_book
#   self.book.attach(io: File.open("app/assets/books/book1_english.pdf"), filename: "book1_english.pdf", content_type: "application/pdf")
#   # self.save
# end
