//
//  main.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation


//stats player
var mxHP = 100
var maxHealth = 100
var mxMP = 50
var maxMana = 50
var pots = 10
var elixirs = 10
var shield = false
var nameP = ""
var lvl = 1
var strength = 10
var hasGun = false
var defense = 0
var hasArmor = false

//stats musuh
var health = 300
var maxHealthEnemy = 300
var strengthEnemy = 10
var nameEnemy = "test"

//save intros
let intros = ["Troll": "\nAs you arrive in the forest of trolls, you feel a sense of unease wash over you.\nSuddenly you hear the sounds of twigs snapping behind you. You quickly spin around and find a Troll looming over you.",
              "Golem": "\nAs you make your way through the rugged mountain terrain, you can feel the hill of the wind biting at your  skin.\nSuddenly, you hear you hear a sound that makes you freeze in your tracks. That's when you see it - a massive ,snarling Golem emerges from the shadows.",
              "BIG BOSS": "The BOSS looms over you ready to end this all! \nDefeat him and end his reign!!!"]

startGame()

func startGame(){
    var input = ""
    repeat{
        print("Welcome to the world of Murim! 🥊 \n")
        print("You have been chosen as a young martial artist to embark on a long journey to become the Dragon Warrior. Your adventure will take you through caves, forests, mountains, and dungeons where you will face enemies, make allies, and face challenges! \n")
        print("Press [return] to continue: ")
        
        input = String(readLine() ?? "")
       
        if(input == ""){
            welcomeScreen()
        }
    }while(input != "")
}

func welcomeScreen(){
    while true {
        print("May I ask your name young martial artist?")
        let gg = readLine() ?? ""
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        
        if namePredicate.evaluate(with: gg) {
            // Valid input, name only contains characters a-z and A-Z
            print("\nNice to meet you, \(gg)!")
            nameP = gg
            journeyScreen()
            break // Exit the loop
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }
}

func journeyScreen(){
    while true {
        //main menu
        print("\nFrom here you can... \n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potions")
        print("[D]rink elixirs to fill your mana \n")
        print("Or choose where you want to go \n")
        print("[F]orest of Trolls")
        print("[M]ountain of Golems")
        print("[E]vil Island")
        print("[Q]uit Game \n")
        print("Your Choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "c"){
            showStats()
        }else if(input == "h"){
            healWounds()
        }else if(input == "d"){
            drinkElixir()
        }else if(input == "f"){
            //setting the enemy stats
            health = 300
            maxHealthEnemy = 300
            strengthEnemy = 10
            nameEnemy = "Troll"
            battle()
        }else if(input == "m"){
            //setting the enemy stats
            health = 600
            maxHealthEnemy = 600
            strengthEnemy = 20
            nameEnemy = "Golem"
            battle()
        }else if(input == "e"){
            //setting the enemy stats
            health = 1000
            maxHealthEnemy = 1000
            strengthEnemy = 40
            nameEnemy = "BIG BOSS"
            battle()
        }else if(input == "q"){
            print("\nThat will be the end of our adventure today! Fare thee well young martial artist!   \n\n")
            break
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }
}

func showStats(){
    print("\n===========================================")
    print("Player Name  : \(nameP)")
    print("Player Level : \(lvl)")
    print("\nPlayer Health: \(maxHealth)/\(mxHP)")
    print("Player Mana  : \(maxMana)/\(mxMP)")
    print("Strength     : \(strength)")
    print("Defense      : \(defense)")
    print("\nMagic:")
    //showing skills based on weapon
    if(hasGun){
        print("- Shoot. No Mana Required. Deal light damage.")
        print("- Headshot!. 10 Mana Required. Deal heavy damage.")
    }else{
        print("- Bludgeon. No Mana Required. Deal light damage.")
        print("- Blind Tiger Strike. 10 Mana Required. Deal heavy damage.")
    }
    print("- Black Turtle Formation. 10 Mana Required. Block enemy's attack for 1 turn.")
    print("\nItems:")
    print("- Potion x\(pots). Heal 20 HP.")
    print("- Elixir x\(elixirs). Heal 10 MP")
    while true{
        print("Press [return] to go back.")
        let input = String(readLine() ?? "")
        if(input == ""){
            break
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }
    print("\n===========================================")
}

func healWounds(){
    var input = "dylanganteng"
    var onrepeat = false
    repeat{
        if(pots == 0){
            while true{
                print("\nYou don't have anymore potions left. Be careful from here on out.")
                print("Press [return] to continue.")
                input = String(readLine() ?? "")
                if(input == ""){
                    break
                }else{
                    print("\nINPUT A PROPER INPUT!\n")
                }
            }
            if(input == ""){
                break
            }
        }
        print("\nYour HP is \(maxHealth)/\(mxHP).")
        print("You have \(pots) potions left.")
        if(onrepeat){
            print("\nStill want to use 1 potion to heal again?  [Y/N]")
        }else{
            print("\nAre you sure you want to use 1 potion to heal?  [Y/N]")
        }
        
        input = readLine()?.lowercased() ?? ""
        
        if(input == "y"){
            usePotion()
            onrepeat = true
        }else if(input == "n"){
            
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }while(input != "n")
}

func drinkElixir(){
    var input = "dylanganteng"
    var onrepeat = false
    repeat{
        if(elixirs == 0){
            while true{
                print("\nYou don't have anymore elixirs left. Be careful from here on out.")
                print("Press [return] to continue.")
                input = String(readLine() ?? "")
                if(input == ""){
                    break
                }else{
                    print("\nINPUT A PROPER INPUT!\n")
                }
            }
            if(input == ""){
                break
            }
        }
        print("\nYour MP is \(maxMana)/\(mxMP).")
        print("You have \(elixirs) elixirs left.")
        if(onrepeat){
            print("\nStill want to use 1 elixir to heal again?  [Y/N]")
        }else{
            print("\nAre you sure you want to use 1 elixir to heal?  [Y/N]")
        }
        
        input = readLine()?.lowercased() ?? ""
        
        if(input == "y"){
            useElixir()
            onrepeat = true
        }else if(input == "n"){
            
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }while(input != "n")
}

func battle(){
    var scanned = false
    var charged = 1
    var leave = false
    
    //small intro based on enemy name
    
    print(intros[nameEnemy]!)
    
    
    //looping main battle logic
    while true{
        //deciding enemy attack pattern (normal attack or charge)
        var special = Int.random(in: 1...6)
        if(charged == 3){
            special = 3
        }
        
        while true{
            print("\n😈 Name  : \(nameEnemy)")
            if(scanned){
                print("😈 Health: \(health)/\(maxHealthEnemy)")
            }else{
                print("😈 Health: ????")
            }
            print("==============\n")
            print("💩 Name  : \(nameP)")
            print("💩 Health: \(maxHealth)/\(mxHP)")
            print("💩 Mana  : \(maxMana)/\(mxMP)")
            print("\nChoose your action:")
            if(hasGun){
                print("[1] Shoot. No Mana Required. Deal light damage.")
                print("[2] Headshot!. 10 Mana Required. Deal heavy damage.")
            }else{
                print("[1] Bludgeon. No Mana Required. Deal light damage.")
                print("[2] Blind Tiger Strike. 10 Mana Required. Deal heavy damage.")
            }
            print("[3] Black Turtle Formation. 10 Mana Required. Block enemy's attack for 1 turn.")
            print("\n[4] Use potion to heal")
            print("[5] Scan enemy's vitals")
            print("[6] Flee from battle")
            print("\nYour choice?")
            
            let input = readLine()?.lowercased()
            
            if(input == "1"){
                let dmg = strength + 15
                enemytakeDamage(amount: dmg)
                print("\nYour normal attack dealt \(dmg) damage!\n")
                break
            }else if(input == "2"){
                if(maxMana < 10){
                    print("You do not have enough mana! \n")
                }else{
                    useMana(amount: 10)
                    let dmg = strength * 2 + 50
                    enemytakeDamage(amount: dmg)
                    print("\nYour skill dealt \(dmg) damage!\n")
                }
                break
            }else if(input == "3"){
                userdefend()
                break
            }else if(input == "4"){
                healWounds()
                break
            }else if(input == "5"){
                scanned = true
                break
            }else if(input == "6"){
                print("You feel that if you don't escape soon enough, you won't be able to continue the fight.")
                print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
                print("\n You are safe for now.")
                print("Press [return] to continue: ")

                let input = String(readLine() ?? "")
               
                if(input == ""){
                    leave = true
                }
                break
                
            }else{
                print("\nINPUT A PROPER INPUT!\n")
            }
        }
        
        
        
        if(health <= 0){
            print("You have slain \(nameEnemy)! You have leveled up! 🏆\n")
            
            //call function for battle rewards
            reward(name: nameEnemy)
            while true{
                print("Press [return] to continue.")
                let input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
            break
        }
        if(leave == false){
            
            //charge attack for next turn
            if(special == 6){
                if(nameEnemy == "Troll"){
                    print("The Ogre is charging his attack!")
                }else if(nameEnemy == "Golem"){
                    print("The Golem is preparing for huge attack!")
                }else if(nameEnemy == "BIG BOSS"){
                    print("The BOSS is preparing a huge attack!")
                }
                print("\nYou have to block this attack!!!\n")
                charged = 3
                while true{
                    print("Press [return] to continue.")
                    let input = String(readLine() ?? "")
                    if(input == ""){
                        break
                    }
                }
            }else{
                //no damage if player had used guard the previous turn
                if(shield){
                    shield = false
                    if(nameEnemy == "Troll"){
                        print("The Ogre Slammed his club at you! \nYou blocked the Attack!")
                    }else if(nameEnemy == "Golem"){
                        print("The Golem threw a rock at you! \nYou blocked the Attack!")
                    }else if(nameEnemy == "BIG BOSS"){
                        print("The BOSS threw a left hook! \nYou blocked the Attack!")
                    }
                    
                    charged = 1
                    
                    while true{
                        print("Press [return] to continue.")
                        let input = String(readLine() ?? "")
                        if(input == ""){
                            break
                        }
                    }
                }else{
                    //enemy attack, use multiplier if charged the previous turn
                    let ouch = strengthEnemy * charged
                    charged = 1
                    usertakeDamage(amount: ouch)
                    var dmg = ouch - defense
                    if(dmg < 0){
                        dmg = 0
                    }
                    if(nameEnemy == "Troll"){
                        print("The Ogre Slammed his club at you! \nYou take \(dmg) Damage!")
                    }else if(nameEnemy == "Golem"){
                        print("The Golem threw a rock at you! \nYou take \(dmg) Damage!")
                    }else if(nameEnemy == "BIG BOSS"){
                        print("The BOSS threw a left hook! \nYou take \(dmg) Damage!")
                    }
                    
                    while true{
                        print("Press [return] to continue.")
                        let input = String(readLine() ?? "")
                        if(input == ""){
                            break
                        }
                    }
                }
            }
        }
        
        //check for player death after enemy attack
        if(maxHealth <= 0){
            print("\n\n\n\n\nYou died :(")
            print("That is the end of \(nameP)'s adventure.")
            print("Adventurer Score : \(lvl * 1000 - 10000)")
            exit(0)
        }
        //this leaves the battle loop and returns to the previous menu.
        if(leave){
            break
        }
        
    }
    
}

//rewards given based on chance and enemy name
func reward(name: String){
    if(name == "Troll"){
        //call function to increase user strength and deciding what reward to give the player
        userlvlup(levels: 2)
        let prob = Int.random(in: 1...10)
        if(prob >= 6){
            print("Nice! You found some Potions!")
            let p = Int.random(in: 2...3)
            print("Gained \(p) Potions!")
            pots += p
        }else if(prob <= 3){
            //gives player items, if rediscovered then it gives the player item rewards.
            if(hasGun == false){
                print("You found a treasure chest nearby and find a gun!")
                while true{
                    print("Will you equip the gun? [Y/N]\n")
                    let input = readLine()?.lowercased() ?? ""
            
                    if(input == "y"){
                        print("You have equipped the gun!\n")
                        strength += 25
                        hasGun = true
                        break
                    }else if(input == "n"){
                        print("You decide a gun does not belong in this game :(\n")
                        break
                    }else{
                        print("\nINPUT A PROPER INPUT!\n")
                    }
                }
            }else{
                let p = Int.random(in: 1...3)
                let e = Int.random(in: 2...5)
                print("Jackpot! You found a lot of items!")
                print("Gained \(p) Potions!")
                print("Gained \(e) Elixirs!")
                pots += p
                elixirs += e
            }
        }else{
            print("Nice! You found some Elixirs!")
            let p = Int.random(in: 3...5)
            print("Gained \(p) Elixirs!")
            elixirs += p
        }
    }else if(name == "Golem"){
        userlvlup(levels:8)

    
        
        let prob = Int.random(in: 1...10)
        if(prob >= 6){
            print("Nice! You found some Potions!")
            let p = Int.random(in: 4...6)
            print("Gained \(p) Potions!")
            pots += p
        }else if(prob <= 3){
            if(hasArmor == false){
                print("You found a treasure chest nearby and find Armor!")
                while true{
                    print("Will you equip the Armor? [Y/N]\n")
                    let input = readLine()?.lowercased() ?? ""
            
                    if(input == "y"){
                        print("You have equipped the gun!\n")
                        defense += 20
                        hasArmor = true
                        break
                    }else if(input == "n"){
                        print("You decide you don't need Armor!\n")
                        break
                    }else{
                        print("\nINPUT A PROPER INPUT!\n")
                    }
                }
            }else{
                let p = Int.random(in: 3...6)
                let e = Int.random(in: 4...7)
                print("Jackpot! You found a lot of items!")
                print("Gained \(p) Potions!")
                print("Gained \(e) Elixirs!")
                pots += p
                elixirs += e
            }
        }else{
            print("Nice! You found some Elixirs!")
            let p = Int.random(in: 4...6)
            print("Gained \(p) Elixirs!")
            elixirs += p
        }
    }else{
        //reward for defeating boss is win, then exit system.
        print("\n\n\n\nYou have saved humanity from Bob! The day is saved!")
        print("This is the end of your adventure! \(name) is a hero for all!")
        print("Adventurer Score : \(lvl * 1000 + 50000)\n\n\n\n\n\n\n")
        exit(0)
    }
}

func usertakeDamage(amount: Int){
    //only run the function if player dont have shield
    if(shield == true){
        print("\nYou have defended yourself!\n")
    }else{
        let dmg = amount - defense
        maxHealth -= dmg
        if maxHealth < 0 {
            maxHealth = 0
        }
    }
}

func userlvlup(levels: Int){
    //increase lvl increases other stats.
    for i in Range(1...levels) {
        lvl += 1
        strength += 2
        mxHP += 2
        mxMP += 1
    }
}

func useMana(amount: Int){
    maxMana -= amount
    
}

func userdefend(){
    shield = true
}

func usePotion() {
    if pots > 0 {
        maxHealth += 20
        if (maxHealth > mxHP){
            maxHealth = mxHP
        }
        pots -= 1
        print("Player used a potion. Health is now \(maxHealth). Potions left: \(pots).")
    } else {
        print("No potions left!")
    }
}

func useElixir() {
    if elixirs > 0 {
        maxMana += 10
        if (maxMana > mxMP){
            maxMana = mxMP
        }
        elixirs -= 1
        print("Player used an elixir. Mana is now \(maxMana). Elixirs left: \(elixirs).")
    } else {
        print("No elixirs left!")
    }
}

func enemytakeDamage(amount: Int) {
    health -= amount
    if health < 0 {
        health = 0
    }
}






