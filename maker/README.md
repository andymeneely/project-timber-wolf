Disclaimer: if you are embarking on this project, be ready to make plenty of adjustments for yourself. Laser cutters in particular have their own quirks, so be ready for some experimentation on that front.

What follows is a collection of my own notes about I made my own deluxe version of _Your Last Heist_.

I use 3mm 12x12 plywood for this project, bought from [Woodpeckers](https://www.amazon.com/dp/B013NT3OAC/_encoding=UTF8?coliid=I3QFND208OX3OT&colid=IAYRBA26OFG1).

# Laser Cutting in General

For me, I ran my laser cuts at [The Construct@RIT](http://hack.rit.edu) using the Full Spectrum P48-36 laser cutter.

I ALWAYS make sure I do a couple of tests on scrap wood to make sure I get the right settings. Since this laser cutter is in a communal space, sometimes the cutter is out of alignment and isn't as powerful as it could be. Thus, it's important to test things out to make sure you're minimizing scorching, etc.

For blue lines: these are *scoring*, which is where the laser is running like a pen-plotter creating thin, brown lines but not cutting the wood. I used 0.25%-1% power, and made sure that the focal point of the bed is sitting on the *top* of the material. The thinner the lines, the better this looks overall.

For red lines, this is *cutting*. I usually use 60% power, 100% speed for this.

For green lines, make sure you set the laser cutter to ignore these. These are used to register layers front-to-back in the design phase.

I always do *scoring* first, then *cutting*. When the pieces get cut, they will fall down a little bit because of the curvature of the wood, so it's better to score first. I usually have to weigh down the plywood to keep it from bending as well, just make sure the laser cutter head won't collide with your weights.

I don't have any rastering in this maker edition - it takes a very long time, and usually the machine is under a lot of demand in our makerspace. So it's all vectoring!

# Laser Cutting Chits and Tiles

Use the files in the `maker` folder.

The `chits 11x11.svg` file is a front-to-back file. Make sure you do the **back** layer first. The back layer has some small cut lines that go all the way through - make sure you still cut those because then when you flip over you can align the borders with the L-cuts. Flip over this page bottom-over-top.

The `interlocking tiles` files are NOT front-to-back - they are only the front. So just cut and be done!

# Making the Vault Box

TBD. Use the `vault box.svg` file to laser cut. This one is a tad more complicated as it has acrylic, bolts, etc.

# Making the Cards

TBD

# Printing Scenarios & Rules

The scenarios and rules are designed to fit a small form factor, and are spread out so that you can progressively reveal them in the game.

For my Brother Color Laser printer (HL-3170CDW)

* I like to print this out double-sided on regular 8.5x11 paper, then cut it down.
* My printer driver doesn't center things in the page when the document size doesn't match the paper size. Yours might be different, but it's a really frustrating problem. SO, here's my solution. Microsoft Edge is the only browser that I can find (none of the others unfortunately) that will center each page for duplex printing. So you can just print them out, cut them down to size, and hole-punch from there.

Solutions that I've tested that don't work:
* SumatraPDF - just delegates to my Brother driver
* Chrome - not enough options, doesn't center it, and doesn't *actually* do two-sided printing if you tell it to.

Microsoft Edge Options:
* Portrait
* Duplex printing: Long Edge (Automatic)
* Paper size: Letter
* Output quality: high quality
* Color mode: color
* Document binding: left edge
