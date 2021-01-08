from weasyprint import HTML
document = HTML('rules/RULES.html').render()
document.write_pdf('_output/RULES.pdf')
