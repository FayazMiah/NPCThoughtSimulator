local module = {}

local subjects = {
	"I", "you", "he", "she", "they", "we", "babe",
	"cat", "bottle", "gamer", "void", "brain", "ghost",
	"skibidi", "homegirl", "boyfriend", "girlfriend", "ref", "tung tung sahor",
	"tralaleo tralala", "artist", "student", "teacher", "streamer", "mod", "simp",
	"e-girl", "e-boy", "gremlin", "rat", "skeleton", "zombie", "NPC", "boss",
	"hero", "villain", "alien", "robot", "meme", "influencer", "nerd", "gamer girl",
	"shy one", "extrovert", "introvert", "bro", "bestie", "enemy", "rival",
	"parent", "intern", "king", "queen", "witch", "wizard", "cryptid", "demon",
	"angel", "entity", "lurker", "stalker", "shuffler", "cursed", "roommate",
	"neighbour", "bossman", "catgirl", "catboy", "doggo", "pupper", "ghostie",
	"fairy", "dragonite", "slime", "elf", "dwarf", "orc", "goblin", "alien parasite",
	"space cow", "eldritch god", "vending machine", "toaster", "gamer bro", "shy guy",
	"average joe", "anime boy", "anime girl", "VTuber", "streamer chat", "discord mod",
	"redditor", "Twitter user", "internet kid", "zoomer", "boomer", "gen z", "gen x",
	"millennial", "office worker", "barista", "cashier", "delivery guy", "pizza guy",
	"taxi driver", "gamer squad", "book nerd", "library ghost", "coding wizard",
	"midnight thinker", "bed goblin", "pasta boy", "pizza girl", "sushi chef",
	"fishman", "crab person", "gamer mom", "gamer dad", "gamer uncle", "gamer aunt",
	"gamer grandpa", "gamer grandma", "internet cat", "internet dog", "couch potato",
	"lab rat", "test subject", "phone addict", "scrolling zombie", "lurking viewer",
	"shy classmate", "lunch thief", "vending machine guy", "elevator rider",
	"bathroom singer", "midnight snacker", "3am screamer", "insomnia beast",
	"caffeine gremlin", "zombie slayer", "dragon tamer", "elf lord", "witch king",
	"doom guy", "vault dweller", "space marine", "forest hermit", "urban wizard",
	"dungeon rat", "night shift worker", "ghost in the machine", "skeleton bard",
	"zombie mime", "lurking shadow", "digital wizard", "cursed streamer",
	"haunted bot", "void beast", "pixel ghost", "low fps gamer", "high ping warrior",
	"broken keyboard user", "brainrot goblin", "forever lurker", "doom scroller",
	"reply guy", "dm sender", "shy artist", "shy gamer", "shy streamer", "shy lurker",
	"skibidi rizzler", "sigma cat", "ohio guy", "goon cave goblin", "cursed e-girl",
	"tung tung skibidi", "nerd emoji", "soyjak wojak", "blue screen warrior",
	"sleepy doom scroller", "midnight pogger", "dank wizard",
	"kek lord", "ratio demon", "tiktok zombie", "fortnite gamer",
	"trashcan boy", "shy uwu user", "cringe rat",
	"clout goblin", "malding streamer", "gamer greaseball",
	"discord mod archetype", "shart poster", "neurospicy user",
	"broccoli alien", "cat meme overlord", "wifi parasite",
	"twitter doomscroller", "pepe grimace lord", "wholesome degenerate",
	"bathwater drinker", "data hoarder hermit", "emoji spammer",
	"shill bot", "anime pfp demon", "AFK bro", "gen alpha screamer",
	"amongus sus lord", "no life gamer",
	"floppa enjoyer", "low fps degenerate", "trashpile roommate",
	"shart goblin", "bruh moment warrior", "femboy catboy hybrid",
	"gremlin with internet access", "quandale dingle", "kumalala savesta",
	"fanum tax", "sigma", "goofy Ahh", "level 10 cake", "baby gronk",
	"bus", "fyne sheeeeee", "rizzler", "sussy baka", "ohio", "john pork", "grimace Shake",
	"huggy wuggy", "nathaniel b", "amogus"
}

module.SUBJECT = subjects

local verbs = {
	"is", "are", "was", "were", "be", "become", "have", "has", "had",
	"want", "needs", "craves", "tries", "loves", "hates",
	"likes", "despises", "fears", "finds", "sees", "hears",
	"goes", "returns", "arrives",
	"appears", "disappears", "escapes", "enters", "exits", "attacks", "destroys",
	"kills", "hunts", "haunts", "stalks", "lurks",
	"lingers", "whispers", "shrieks", "screams", "screeches", "cries", "laughs",
	"giggles", "growls", "hisses", "pounces", "bites", "stabs", "slashes",
	"punches", "kicks", "stomps", "slams", "crashes", "burns", "melts", "freezes",
	"shatters", "splatters", "spins", "twitches", "shakes", "quakes",
	"wobbles", "vibrates", "hums", "stutters",
	"stumbles", "trips", "falls", "drops", "catches", "holds", "grabs", "snatches",
	"steals", "hoards", "begs", "pleads", "prays", "chants", "waits", "sleeps",
	"wakes", "dreams", "remembers", "forgets", "writes", "draws", "codes",
	"talks", "shouts", "howls", "moans", "whimpers",
	"looksmaxxed", "packed", "spams", "yeets", "lag spikes", "teleports", "clutches",
	"faceplants", "rage quits", "speedruns", "trash talks", "ghosts", "trolls",
	"1v1s", "AFKs", "spawns", "despawns", "respawns", "dabs", "twerks",
	"clips", "no-scopes", "potatoes", "face rolls", "trash farms", "grinds", "no-lifes",
	"clones", "deletes", "devolves", "hits", "rizzes"
}

module.VERB = verbs

local adjectives = {
	"huge", "tiny", "ugly", "neon", "sad", "tired", "dead", "cursed", "mega", "hyper",
	"super", "broken", "brokenhearted", "lonely", "chaotic", "grim", "shiny", "wet",
	"dry", "burning", "melting", "falling", "shaking", "cursed", "holy", "godly",
	"rotting", "crawling", "sleeping", "awake", "twisted", "corrupted", "grimy", "dusty",
	"broken", "lovely", "hateful", "hopeful", "doomful", "doomsday", "infinite", "tiny",
	"colossal", "strange", "monstrous", "shy", "bold", "awkward", "shy", "shyly",
	"monstrous", "grimdark", "cute", "ugly", "disgusting", "beautiful", "serene",
	"eerie", "misty", "smoky", "burning", "ice-cold", "blazing", "sharp", "rounded",
	"spiky", "fuzzy", "silky", "soft", "hard", "crusty", "flaky", "neon", "vivid",
	"faint", "faintly", "wildly", "wildly", "wildly strange", "nastilly", "obliteratively"
}

module.ADJECTIVE = adjectives

local nouns = {
	"vibe", "space", "room", "floor", "ceiling", "wall", "door", "window", "shadow",
	"mist", "flame", "spark", "ember", "star", "planet", "moon", "sun", "galaxy",
	"universe", "void", "cave", "tower", "dungeon", "crypt", "grave", "altar", "statue",
	"mask", "helmet", "blade", "sword", "hammer", "keyboard", "mouse", "screen",
	"phone", "laptop", "controller", "doorbell", "windowpane", "floorboard",
	"ceiling fan", "vending machine", "fridge", "toaster", "bed", "chair", "desk",
	"table", "lamp", "couch", "rug", "shirt", "pants", "shoe", "coat", "jacket",
	"hoodie", "book", "page", "paper", "pen", "pencil", "keyboard", "microphone",
	"camera", "lens", "eye", "hand", "finger", "tooth", "bone", "skull", "heart",
	"brain", "thought", "memory", "moment", "sound", "whisper", "scream", "screech",
	"hum", "cry", "moan", "laugh", "giggle", "growl", "hum", "sigh", "pulse", "beat",
	"glow", "mist", "fog", "mistcloud", "mistveil", "mistshroud", "mistmask", "mistthing",
	"mistface", "mistman", "mistghost", "mistdemon", "baby gronk", "toilet", "mug", "door", "bean", "underwear",
	"sword", "mercy", "help", "silence", "release", "death", "more", "nothing",
	"pizza", "chips", "wifi", "doom", "void", "try", "sanity", "the void", "the opps", "red card"
}

module.NOUN = nouns

local adverbs = {
	"quickly", "wildly", "slowly", "desperately", "awkwardly", "quietly", "violently",
	"sharply", "softly", "faintly", "wildly", "endlessly", "eerily", "bravely",
	"shyly", "boldly", "timidly", "roughly", "harshly", "lovingly", "madly", "calmly",
	"serenely", "sadly", "coldly", "hotly", "dimly", "briefly", "endlessly",
	"forever", "now", "soon", "later", "eventually", "finally", "suddenly",
	"suddenly wildly", "suddenly quietly", "uncontrollably"
}

module.ADVERB = adverbs

local connectors = {
	"and", "or", "but", "because", "except", "like", "as", "still", "yet",
	"although", "despite", "unless", "until", "whenever", "wherever", "somehow",
	"however", "nonetheless", "moreover", "similarly", "additionally", "alternatively",
	"for"
}

module.CONNECTOR = connectors

local determiners = {
	"a", "an", "the", "this", "that", "these", "those", "some", "many", "no",
	"every", "any", "one", "both", "all", "few", "enough", "too much", "too little",
	"too many", "too few", "their"
}

module.DETERMINER = determiners

local interjections = {
	"bruh", "omg", "wow", "hey", "fr", "no cap", "lmao", "help", "oh god", "ugh",
	"ew", "eek", "yikes", "sheesh", "oop", "pog", "uhhh", "um", "huh", "ahh", "ack",
	"wtflip", "smh", "tsk", "nah", "nope", "yup", "yee", "yeehaw", "aww", "eww", "lol", "nocap",
	"bop", "im dyingg", "breda", "yo", "dawg", "yhhhhh", "dead"
}

module.INTERJECTION = interjections

local moodModifiers = {
	"literally", "actually", "so big", "mega", "hyper", "super", "ultra", "very", "insanely",
	"wildly", "ridiculously", "truly", "deeply", "completely", "endlessly",
	"overwhelmingly", "disturbingly", "eerily", "cursedly", "doomily", "oddly",
	"strangely", "paradoxically", "absolutely", "remarkably", "bizarrely", "tragically", "skibidily", "megaly",
	"the most"
}

module.MOOD_MODIFIER = moodModifiers

local emoticons = {
	">.<", "._.", "??", "??", "??", "??", "?", "??", "??", "??", "??", "??", "??", "????",
	"??", "??", "??", "??", "??", "??", "????", "??", "??", "??", "??", "??", "???", "???",
	"??", "??", "??", "??", "??", "??", "??", "?", "?", "??", "??", "??"
}

module.EMOTICON = emoticons

local contextTags = {
	"#meirl", "#help", "#pain", "#relatable", "#brainrot", "#tired", "#sleepy",
	"#cringe", "#flipmylife", "#nope", "#lol", "#wtflip", "#noone", "#ghosted",
	"#me_irl", "#void", "#doom", "#justme", "#depression", "#coping", "#shook",
	"#godhelpme", "#justvibes", "#sleepdeprived", "#3amthoughts", "#spacedout",
	"#shygirl", "#shygamer", "#shystreamer", "#shylurker", "#shyartist"
}

module.CONTEXT_TAG = contextTags

return module
