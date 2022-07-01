from weasyprint import HTML
document = HTML('rules/BOOK.html').render()
document.write_pdf('_output/BOOK.pdf')