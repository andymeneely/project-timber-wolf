from weasyprint import HTML

# Adapted from: https://github.com/Kozea/WeasyPrint/issues/23#issuecomment-312447974
# def generate_outline_str(bookmarks, indent=0):
#     outline_str = ""
#     for i, (label, (page, _, _), children) in enumerate(bookmarks, 1):
#         outline_str += ('%s%d. %s (page %d)' % (
#         ' ' * indent, i, label.lstrip('0123456789. '), page))
#         outline_str += generate_outline_str(children, indent + 2)
#         return outline_str

document = HTML('scenarios/rivercity/booklet.html').render()

# table_of_contents_string = generate_outline_str(document.make_bookmark_tree())
# table_of_contents_document = HTML(string=table_of_contents_string).render()
# table_of_contents_page = table_of_contents_document.pages[0]
# document.pages.insert(0, table_of_contents_page)

document.write_pdf('_output/rivercity.pdf')
