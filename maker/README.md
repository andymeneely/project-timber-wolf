Disclaimer: if you are embarking on this project, be ready to make plenty of adjustments for yourself. Laser cutters in particular have their own quirks, so be ready for some experimentation on that front.

What follows is a collection of my own notes about I made my own deluxe version of _Your Last Heist_.

I use 3mm 12x12 plywood for this project, bought from [Woodpeckers](https://www.amazon.com/dp/B013NT3OAC/_encoding=UTF8?coliid=I3QFND208OX3OT&colid=IAYRBA26OFG1). These designs are built around 11 or 11.5 inch designs so that you have some space around the edges to weigh or clamp down the edges.

# Laser Cutting in General

For me, I ran my laser cuts at [The Construct@RIT](http://hack.rit.edu) using the Full Spectrum P48-36 laser cutter.

I ALWAYS make sure I do a couple of tests on scrap wood to make sure I get the right settings. Since this laser cutter is in a communal space, sometimes the cutter is out of alignment and isn't as powerful as it could be. Thus, it's important to test things out to make sure you're minimizing scorching, etc.

For blue lines: these are **scoring**, which is where the laser is running like a pen-plotter creating thin, brown lines but not cutting the wood. I used 0.25%-1% power, and made sure that the focal point of the bed is sitting on the *top* of the material. The thinner the lines, the better this looks overall.

For red lines, this is **cutting**. I usually use 60% power, 100% speed for this. I made sure the focal point of the laser is in the *middle* of the material.

For green lines, make sure you set the laser cutter to ignore these. These are used to register layers front-to-back in the design phase.

I always do *scoring* first, then *cutting*. When the pieces get cut, they will fall down a little bit because of the curvature of the wood, so it's better to score first. I usually have to weigh down the plywood to keep it from bending as well, just make sure the laser cutter head won't collide with your weights.

I don't have any rastering in this maker edition. Rastering takes a very long time, and usually the machine is under a lot of demand in our makerspace. So it's all vectoring! But if you have your own cutter, or lots of time on a cutter, then you might enjoy adding some fill color to some of the components for rastering.

# Laser Cutting Chits and Tiles

The `chits 11x11.svg` file is a front-to-back file. Make sure you do the **back** layer first. The back layer has some small cut lines that go all the way through - make sure you still cut those because then when you flip over you can align the borders with the L-cuts. Flip over the piece bottom-over-top and align your laser's bounding box to the little "L" cuts from the other side.

The `interlocking tiles` files are NOT front-to-back - they are only the front. So just score+cut and be done!

# Painting

The planning tokens (little hexes) need to be painted according to player color. Painting tiny little bits can be challenging - be sure to figure out your process for this.

I've included some Meeple shapes so you can make your own. Glue two on top of each other to get a thick meeple, and then color according to player color.

The Pressure Sensors also should be colored. They technically don't need it because they have X and Y, but some paint certainly would help.

# Making the Vault Box

TBD. Use the `vault box.svg` file to laser cut. This one is a tad more complicated as it has an acrylic sheet, bolts, etc.

# Making the Cards

TBD

# Printing Scenarios & Rules

The scenarios and rules are designed to fit a small form factor, and are spread out so that you can progressively reveal them in the game.

For my Brother Color Laser printer (HL-3170CDW)

* I like to print this out double-sided on regular 8.5x11 paper, then cut it down.
* My printer driver doesn't center things in the page when the document size doesn't match the paper size. Yours might be different, but it's a really frustrating problem. SO, here's my solution. Microsoft Edge is the only browser that I can find (none of the others unfortunately) that will center each page for duplex printing. So you can just print them out, cut them down to size, and hole-punch from there. The laser-cut pieces include some binder rings for this.

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

# Other components you'll need

You'll need dice. The game has been designed around 12mm cubes. Make sure the dice colors match the player colors.
