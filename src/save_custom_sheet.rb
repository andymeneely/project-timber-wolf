require 'yaml'
require 'cairo'

module Squib

  class Deck

    def avery_template
      YAML.load_file('data/avery_5408.yml')
    end

    def to_px(arg, dpi = 300)
      case arg.to_s.rstrip
      when /in$/ # ends with "in"
        arg.rstrip[0..-2].to_f * dpi
      else
        arg
      end
    end

    def init_cc(to, tmpl)
      sheet_width = to_px(tmpl['sheet_width']) * 72.0 / 300.0 # dpi -> points
      sheet_height = to_px(tmpl['sheet_height']) * 72.0 / 300.0 # dpi -> points
      surface = Cairo::PDFSurface.new(to, sheet_width, sheet_height)
      cc = Cairo::Context.new(surface)
      cc.scale(72.0 / 300.0, 72.0 / 300.0) # make it like pixels
      return cc
    end

    def init_wh(tmpl)
      w = to_px(tmpl['card_width'])
      h = to_px(tmpl['card_height'])
      return w, h
    end

    def next_page_if_needed(cc, i, per_sheet)
      if (i != 0) and (i % per_sheet == 0)
        cc.show_page
      end
    end

    def save_avery_5408(to: '_output/avery_5408.pdf')
      tmpl = avery_template
      cc = init_cc(to, tmpl)
      w, h = init_wh(tmpl)
      per_sheet = tmpl['coords'].size
      @cards.each_with_index do |card, i| # assume all cards for now
        next_page_if_needed(cc, i, per_sheet)
        x = to_px(tmpl['coords'][i % per_sheet]['x'])
        y = to_px(tmpl['coords'][i % per_sheet]['y'])
        cc.set_source(card.cairo_surface, x, y)
        cc.paint
      end
    end

  end

end
