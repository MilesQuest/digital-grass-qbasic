COLOR 2, 0
PRINT "MilesQuest presents Digital Grass!"
PRINT
PRINT "You have 100 credits."
PRINT
PRINT "One watering can has 5 uses. Watering cans cost 25 credits."
PRINT "Water is used once daily to keep grass alive."
PRINT
PRINT "One fertilizer bag has 1 use. Fertilizer bags costs 50 credits."
PRINT "Fertilizer is used when your grass is unhealthy."
PRINT
PRINT "A rain bucket costs 50 credits." 
PRINT "Rain buckets can collect water daily."
PRINT
PRINT "Your seeds cost 25 credits. Seeds are a required purchase."
PRINT
PRINT "Press any key to continue."
DO
    key$ = INKEY$
    IF key$ <> "" THEN EXIT DO
LOOP
CLS
PRINT "Seeds purchased!"
PRINT "75 credits remaining."
'You can buy negative amounts of each item, as well as decimals. This was originally an exploit, but I thought it was kind of fun so I kept it.
credits = 75
fertilizer = 0
water = 0
rainbuckets = 0
PRINT
'This is my code for purchasing watering cans.
INPUT "Shopkeeper: How many watering cans would you like to purchase?", waterquantity$
waterquantity = VAL(waterquantity$)
IF waterquantity <> INT(waterquantity) OR waterquantity < 0 THEN
    cheated = 1
    PRINT "Shopkeeper: Entering the black market, are we?"
END IF
IF credits >= (waterquantity * 25) THEN
    credits = credits - (waterquantity * 25)
    water = water + (waterquantity * 5)
    PRINT "Shopkeeper: Pleasure doing business."
ELSE
    PRINT "Shopkeeper: You can't afford that."
END IF
PRINT
    
'This is my code for purchasing fertilizer.
INPUT "Shopkeeper: How much fertilizer would you like to purchase?", fertilizerquantity$
fertilizerquantity = VAL(fertilizerquantity$)
IF fertilizerquantity <> INT(fertilizerquantity) OR fertilizerquantity < 0 THEN
    cheated = 1
    PRINT "Shopkeeper: Entering the black market, are we?"
END IF
IF credits >= (fertilizerquantity * 50) THEN
    credits = credits - (fertilizerquantity * 50)
    fertilizer = fertilizer + (fertilizerquantity)
    PRINT "Shopkeeper: Pleasure doing business."
ELSE
    PRINT "Shopkeeper: You can't afford that."
END IF
PRINT
'This is my code for purchasing a rain bucket.
INPUT "Shopkeeper: How many rain buckets would you like to purchase?", bucketquantity$
bucketquantity = VAL(bucketquantity$)
IF bucketquantity <> INT(bucketquantity) OR bucketquantity < 0 THEN
    cheated = 1
    PRINT "Shopkeeper: Entering the black market, are we?"
END IF
IF credits >= (bucketquantity * 50) THEN
    credits = credits - (bucketquantity * 50)
    rainbuckets = rainbuckets + (bucketquantity)
    PRINT "Shopkeeper: Pleasure doing business."
ELSE
    PRINT "Shopkeeper: You can't afford that."
END IF
PRINT
PRINT "Press any key to continue."
DO
    key$ = INKEY$
    IF key$ <> "" THEN EXIT DO
LOOP
CLS
RANDOMIZE TIMER
PRINT "Inventory:"
PRINT
PRINT "Watering Cans: "; (water / 5); " (you can use it "; (water); " times.)"
PRINT "Fertilizer Bags: "; fertilizer; " (you can use it "; (fertilizer); " times.)"
PRINT "Rain Buckets: "; rainbuckets; " (gives you "; rainbuckets; " water when collected.)"
PRINT
PRINT "Credits Remaining: "; credits
PRINT
PRINT "+1 Receipt"
PRINT
PRINT "Press any key to begin Day 1"
DO
    key$ = INKEY$
    IF key$ <> "" THEN EXIT DO
LOOP
CLS
'These are all the stats that run for the daily loop.
day = 1
plantalive = 1
flower = 0
wateredyet = 0
fertilizerneeded = 0
collectedrain = 0
'This is where my daily loop happens.
DO WHILE day <= 35 AND plantalive = 1
'These are the daily musings.
    SELECT CASE INT(RND * 15)
        CASE 0: musing$ = "A rabbit hops along happily."
        CASE 1: musing$ = "Your grass is vibing."
        CASE 2: musing$ = "The garden gnome in the corner may or may not be possessed."
        CASE 3: musing$ = "Birds are chirping."
        CASE 4: musing$ = "A gentle breeze rolls through."
        CASE 5: musing$ = "Your grass has grown a dandelion, and you make a wish."
        CASE 6: musing$ = "Your grass appears to be warning you about something..."
        CASE 7: musing$ = "A beautiful butterfly flies by."
        CASE 8: musing$ = "A cloud shaped like a cloud rolls by."
        CASE 9: musing$ = "A funny musing appears on your screen."
'These are the daily musings that cause an event, which will hopefully keep players from spamming buttons to skip to the end.
        CASE 10: 
            musing$ = "There isn't any rain today."
            collectedrain = 1
        CASE 11: 
            musing$ = "The skies are clear today, no rain."
            collectedrain = 1
        CASE 12: 
            musing$ = "Your grass is looking unhealthy. Fertilizer might be needed."
            fertilizerneeded = 1
        CASE 13: 
            musing$ = "Your grass grew extra flowers today!"
            flower = flower + 10
        CASE 14: 
            musing$ = "It rained hard last night, so you don't have to water your grass today."
            wateredyet = 1
    END SELECT
    PRINT "Day "; day
    PRINT
    PRINT musing$
    PRINT
    PRINT "You have "; credits; " credits. "
    PRINT
    PRINT "You have "; water; " water uses. "
    PRINT
    PRINT "You have "; fertilizer; " fertilizer bags. "
    PRINT
    PRINT "you have "; rainbuckets; " rainbuckets. "
    PRINT
    PRINT "Your grass has "; flower; " flowers."
    PRINT
    PRINT "-Press 1 to water your grass."
    PRINT "-Press 2 to collect rain from your bucket."
    PRINT "-Press 3 to fertilize your grass."
    PRINT "-Press 4 to sell your flowers."
    PRINT "-Press 5 to enter shop."
    PRINT "-Press 6 to load next day."
'This is the code for all of the keys.
    DO
    key$ = INKEY$
'This is the code to skip to next day.
    IF key$ = "*" THEN
        cheated = 1
        wateredyet = 1
        fertilizerneeded = 0
        key$ = "6"
    END IF
    IF key$ = "1" THEN
        IF water <= 0 THEN
            PRINT
            PRINT "You are out of water."
        ELSE
            water = water - 1
            wateredyet = 1
            PRINT
            PRINT "You water your grass."
        END IF
    END IF
    IF key$ = "2" THEN
        IF rainbuckets <= 0 THEN
            PRINT
            PRINT "You don't have a rain bucket."
        ELSEIF collectedrain = 1 THEN
            PRINT
            PRINT "There isn't any rain to collect!"
        ELSE
            water = water + rainbuckets
            collectedrain = 1
            PRINT
            PRINT "You collect "; rainbuckets; " water from your rain bucket(s)."
        END IF
    END IF
    IF key$ = "3" THEN
        IF fertilizer <= 0 THEN
            PRINT
            PRINT "You do not have any fertilizer."
        ELSE
            fertilizer = fertilizer - 1
            fertilizerneeded = 0
            PRINT
            PRINT "You apply fertilizer to your grass."
        END IF
    END IF
    IF key$ = "4" THEN
        IF flower <= 0 THEN
            PRINT
            PRINT "...You don't have any flowers to sell."
        ELSE
            credits = credits + (flower * 5)
            PRINT
            PRINT "You collect and sell the flowers for"; flower * 5; " credits."
            flower = 0
        END IF
    END IF
    IF key$ = "5" THEN
        CLS
        PRINT "Shopkeeper: Hi there! What can I do for you?"
        PRINT
        PRINT "-Press 1 to purchase a watering can. (25 credits)"
        PRINT
        PRINT "-Press 2 to purchase fertilizer. (50 credits)"
        PRINT
        PRINT "-Press 3 to purchase a rain bucket. (50 credits)"
        PRINT
        PRINT "-Press 4 to leave shop."
        DO
            shopkey$ = INKEY$
            IF shopkey$ = "1" THEN
                IF credits >= 25 THEN
                    credits = credits - 25
                    water = water + 5
                    PRINT
                    PRINT "Shopkeeper: Pleasure doing business."
                ELSE
                    PRINT
                    PRINT "Shopkeeper: You can't afford that."
                END IF
            END IF
            IF shopkey$ = "2" THEN
                IF credits >= 50 THEN
                    credits = credits - 50
                    fertilizer = fertilizer + 1
                    PRINT
                    PRINT "Shopkeeper: Pleasure doing business."
                ELSE
                    PRINT
                    PRINT "Shopkeeper: You can't afford that."
                END IF
            END IF
            IF shopkey$ = "3" THEN
                IF credits >= 50 THEN
                    credits = credits - 50
                    rainbuckets = rainbuckets + 1
                    PRINT
                    PRINT "Shopkeeper: Pleasure doing business."
                ELSE
                    PRINT
                    PRINT "Shopkeeper: You can't afford that."
                END IF
            END IF
        LOOP UNTIL shopkey$ = "4"
        CLS
        PRINT "Inventory:"
        PRINT
        PRINT "Watering Cans: "; (water / 5); " (you can use it "; (water); " times.)"
        PRINT "Fertilizer Bags: "; fertilizer; " (you can use it "; (fertilizer); " times.)"
        PRINT "Rain Buckets: "; rainbuckets; " (Can collect water daily.)"
        PRINT
        PRINT "Credits Remaining: "; credits
        PRINT
        PRINT "Press any key to continue."
        DO
            shopkey$ = INKEY$
        LOOP UNTIL shopkey$ <> ""
        CLS
        PRINT "Day "; day
        PRINT
        PRINT musing$
        PRINT
        PRINT "You have "; credits; " credits. "
        PRINT
        PRINT "You have "; water; " water uses. "
        PRINT
        PRINT "You have "; fertilizer; " fertilizer bags. "
        PRINT
        PRINT "you have "; rainbuckets; " rainbuckets. "
        PRINT
        PRINT "Your grass has "; flower; " flowers."
        PRINT
        PRINT "-Press 1 to water your grass."
        PRINT "-Press 2 to collect rain from your bucket."
        PRINT "-Press 3 to fertilize your grass."
        PRINT "-Press 4 to sell your flowers."
        PRINT "-Press 5 to enter shop."
        PRINT "-Press 6 to load next day."
    END IF
    LOOP UNTIL key$ = "6"
        IF wateredyet = 0 OR fertilizerneeded = 1 THEN
            CLS
            score = (credits + flower + water + fertilizer) * 5
            PRINT "Day "; day
            PRINT
            PRINT "Your grass wilted. Game Over."
            PRINT
            PRINT "Score: "; score
            PRINT
IF cheated = 1 THEN
        PRINT "(But you cheated.)"
        PRINT
    END IF
            PRINT "Press space to quit."
            DO
                deathkey$ = INKEY$
'This is the code for reviving.
                    IF deathkey$ = "r" THEN
                        cheated = 1
                        wateredyet = 1
                        fertilizerneeded = 0
                        plantalive = 1
                        key$ = "6"
                        EXIT DO
                    END IF
                    IF deathkey$ = CHR$(32) THEN
                        plantalive = 0
                    END IF
             LOOP
        END IF
        CLS
        day = day + 1
        wateredyet = 0
        collectedrain = 0
        flower = flower + INT(RND * 6)
    LOOP
'This is the win screen.
IF day > 35 THEN
    CLS
    score = (credits + flower + water + fertilizer) * 5 + 500
    PRINT "They said you needed to touch grass."
    PRINT
    PRINT "But you wouldn't listen."
    PRINT
    PRINT "You toiled endlessly..."
    PRINT 
    PRINT "And you proved them wrong."
    PRINT
    PRINT "Because you touched DIGITAL GRASS!"
    PRINT
    PRINT "Thanks for playing my game. I had a lot of fun coding it, and hopefully you enjoyed playing it."
    PRINT
    PRINT "Game Over. You Win!!!"
    PRINT
    PRINT "Score: "; score
    IF cheated = 1 THEN
        PRINT "(But you cheated.)"
    END IF
END IF