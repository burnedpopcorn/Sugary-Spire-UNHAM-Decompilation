function scr_roomnames(argument0) //scr_roomnames
{
    if (argument0 == undefined)
        argument0 = room
    var room_name = "YOU'RE NOT A SIGMA"
    switch argument0
    {
        case rm_missing:
            room_name = "MISSING ROOM LMAO"
            break
        case realtitlescreen:
        case outer_room1:
        case outer_room2:
        case scootercutsceneidk:
        case hub_start:
            room_name = "Welcome To Sugary Spire!"
            break
        case hub_room1:
        case hub_hall:
        case hub_new:
            room_name = "Enjoy Your Stay"
            break
        case tutorial_1:
            room_name = "The Parlor"
            break
        case tutorial_2:
            room_name = "Points For Tricks"
            break
        case tutorial_3:
            room_name = "Mascot Murdering"
            break
        case tutorial_4:
            room_name = "Grounded"
            break
        case tutorial_5:
            room_name = "Down And Down Again"
            break
        case tutorial_6:
            room_name = "Running Around The Walls"
            break
        case tutorial_7:
            room_name = "Small Step For Candykind"
            break
        case tutorial_8:
            room_name = "Jumping Superbly"
            break
        case tutorial_9:
            room_name = "Jawbreaking Revelations"
            break
        case tutorial_10:
            room_name = "Sugar Rush"
            break
        case entrywaysecret_1:
            room_name = "Hidden Behind Some Walls"
            break
        case entrywaysecret_2:
            room_name = "Probably An Osha Violation"
            break
        case entrywaysecret_3:
            room_name = "Slip and Fall"
            break
        case entryway_1:
            room_name = "Welcome to Sugary Spire"
            break
        case entryway_2:
            room_name = "Hard Hat Required"
            break
        case entryway_3:
            room_name = "Orange City"
            break
        case entryway_4:
            room_name = "Construction Conglomerate"
            break
        case entryway_5:
            room_name = "Had A Joke But I'm Still Working On It"
            break
        case entryway_6:
            room_name = "Down And Around"
            break
        case entryway_7:
            room_name = "Wires And Boxes"
            break
        case entryway_8:
            room_name = "City Outskirts"
            break
        case entryway_9:
            room_name = "Nailed It"
            break
        case entryway_10:
            room_name = "Operation Crunch Creak Construct"
            break
        case entryway_11:
            room_name = "Beary Careful"
            break
        case entryway_portal:
            room_name = "Starting Business All Over"
            break
        case steamy_secret1:
            room_name = "Rocky Road"
            break
        case steamy_secret2:
            room_name = "Digging For Cotton"
            break
        case steamy_secret3:
            room_name = "Kick Gum And Chew Gum"
            break
        case steamy_1:
            room_name = "Welcome to Cottontown!"
            break
        case steamy_2:
            room_name = "Scary Monsters Nice Sights"
            break
        case steamy_3:
            room_name = "Boiler Room"
            break
        case steamy_4:
            room_name = "Cakewalk"
            break
        case steamy_5:
            room_name = "Steamy Cotton Candy"
            break
        case steamy_6:
            room_name = "Skyhigh"
            break
        case steamy_7:
            room_name = "Grand Gateau"
            break
        case steamy_8:
            room_name = "Like Clockwork"
            break
        case steamy_9:
            room_name = "Clocks And Candies"
            break
        case steamy_10:
            room_name = "Race Around The Clock"
            break
        case steamy_11:
            room_name = "Froghop"
            break
        case steamy_11_1:
            room_name = "Top Of The Clock"
            break
        case steamy_12:
            room_name = "Beary Break Room"
            break
        case steamy_13:
            room_name = "Secret Side Room"
            break
        case steamy_14:
            room_name = "Slow And Steady"
            break
        case steamy_portal:
            room_name = "It's Raining Candys Again"
            break
        case molasses_1:
            room_name = "The Swamp of the Spire"
            break
        case molasses_2:
            room_name = "Big Stump"
            break
        case molasses_3:
            room_name = "Bubbly Swamp Water"
            break
        case molasses_4:
            room_name = "Sticky and Wet"
            break
        case molasses_5:
            room_name = "Drowning in Molasses"
            break
        case molasses_6:
            room_name = "The Sweet Smell of Death"
            break
        case molasses_6b:
            room_name = "The Ancient Temple Entrance"
            break
        case molasses_6c:
            room_name = "Ancient Hallways"
            break
        case molasses_7:
            room_name = "Falling and Flinging"
            break
        case molasses_8:
            break
        case molasses_8b:
            room_name = "Molasses Everywhere!"
            break
        case molasses_9:
            room_name = "Gummy Harry in the Ancient Temple"
            break
        case molasses_10:
            room_name = "Don't look down!"
            break
        case molasses_11:
            room_name = "Unstationary Ground"
            break
        case molasses_12:
            room_name = "Froghop Strikes Back!"
            break
        case molasses_13:
            room_name = "The Temple of Goop"
            break
        case molassessecret_1:
            room_name = "Groundpound to go higher!"
            break
        case molassessecret_2:
            room_name = "and this used to be the Bathroom..."
            break
        case molassessecret_3:
            room_name = "Frog Den"
            break
        case molasses_portal:
            room_name = "Sticky Situation"
            break
        case mines_1:
            room_name = "Sugary Spire Underground"
            break
        case mines_2:
            room_name = "Excavation Site"
            break
        case mines_3:
            room_name = "Miner Problem"
            break
        case mines_4:
            room_name = "Rossette's Humble Shoppe"
            break
        case mines_5:
            room_name = "Minecart Troubles"
            break
        case mines_6:
            room_name = "Jawbreaker Centre"
            break
        case mines_7:
            room_name = "Cobalt Caverns"
            break
        case mines_7B:
            room_name = "Mining for Confecti"
            break
        case mines_8:
            room_name = "Journey to the Center of the Jawbreaker"
            break
        case mines_8B:
            room_name = "Straight Drop"
            break
        case mines_9:
            room_name = "RUN AWAY"
            break
        case mines_10:
            room_name = "Even Straighter Drop"
            break
        case mines_11:
            room_name = "Beary Dark Cave"
            break
        case mines_12:
            room_name = "Claustrophic Darkness"
            break
        case mines_13:
            room_name = "The Great Train Escape"
            break
        case minessecret_1:
            room_name = "Jawbreaking Secret"
            break
        case minessecret_2:
            room_name = "Do you Smell Something Burning?"
            break
        case minessecret_3:
            room_name = "Mineykarting"
            break
        case mines_portal:
            room_name = "Who Was Mining Here?"
            break
        case entrywaynew_1:
            room_name = "Welcome to Sugary Spire"
            break
        case entrywaynew_2:
            room_name = "Hard Hat Required"
            break
        case entrywaynew_3:
            room_name = "Don't Slip"
            break
        case entrywaynew_4:
            room_name = "Road Work Ahead"
            break
        case entrywaynew_5:
            room_name = "Had A Joke But Im Still Working On It"
            break
        case entrywaynew_6:
            room_name = "Architecture 101"
            break
        case entrywaynew_6b:
            room_name = "Impractical Scaffolding"
            break
        case entrywaynew_7:
            room_name = "Unsafe Work Environment"
            break
        case entrywaynew_8:
            room_name = "A Metropolis Now"
            break
        case entrywaynew_9:
            room_name = "Nailed It"
            break
        case entrywaynew_10:
            room_name = "Operation Crunch Creak Construct"
            break
        case entrywaynew_11:
            room_name = "Meet Gummy Harry"
            break
        case hub_bikinibottom:
            room_name = "Familiar Place"
            break
        default:
            room_name = "NO ROOMNAME FOUND-1265"
            break
    }

    return room_name;
}

