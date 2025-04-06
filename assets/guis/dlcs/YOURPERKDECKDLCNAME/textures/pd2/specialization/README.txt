
The file "icons_atlas.texture" is where the perk deck icons are. These are what are shown in your inventory menu and perk deck menu.

This specific texture atlas is 256 pixels wide, and 128 pixels tall.
They can theoretically be any size you like (though .dds file type specifications require that each dimension is a multiple of four).

Perk decks have 9 cards in total, though all perk decks added in the base game and official DLCs have:
	5 unique perk cards, and 
	4 "shared" perk cards which are the same between perk decks.

Most custom perk decks are designed the same way.
Therefore, a given custom perk deck will only need 5 unique icons. This image uses 64x64 icons, and there are 8 icon slots (2 rows of 4). 
If you want all 9 icons to be unique, you should make your atlas larger.

Do not rename the icons_atlas.texture file in your final version! The game looks for this name and filepath!
However, make sure to rename the YOURPERKDECKDLCNAME folder!