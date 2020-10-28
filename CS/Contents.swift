import Foundation

protocol Shootable {
    var health: Int { get set }
    var damage: Int { get set }
    
    func shoot(target: inout Shootable)
}

class CounterTerrorist: Shootable {
    var health = 100 {
        willSet {
            self.health -= damage
        }
    }
    var damage = 0
    func shoot(target: inout Shootable) {
        target.health -= damage
    }
}

class Terrorist: Shootable {
    var health = 100 {
        willSet {
            self.health -= damage
        }
    }
    var damage = 0
    func shoot(target: inout Shootable) {
        target.health -= damage
    }
}

var terroristsArray: Array<Terrorist> = []
var counterTerroristsArray: Array<CounterTerrorist> = []
var commandsStack = 0

repeat {
    let terrorists = Terrorist() as Shootable
    let counterTerrorists = CounterTerrorist() as Shootable
    terroristsArray.append(terrorists as! Terrorist)
    counterTerroristsArray.append(counterTerrorists as! CounterTerrorist)
    commandsStack += 1
} while commandsStack <= 4

var terrosistWins: Int = 0
var counterTerroristWins: Int = 0

print("""
          Т \(terrosistWins) : \(counterTerroristWins) CT
    T 1 - \(terroristsArray[0].health) | CT 1 - \(counterTerroristsArray[0].health)
    T 2 - \(terroristsArray[1].health) | CT 2 - \(counterTerroristsArray[1].health)
    T 3 - \(terroristsArray[2].health) | CT 3 - \(counterTerroristsArray[2].health)
    T 4 - \(terroristsArray[3].health) | CT 4 - \(counterTerroristsArray[3].health)
    T 5 - \(terroristsArray[4].health) | CT 5 - \(counterTerroristsArray[4].health)

    """)
var terroristCount = 0
var counterTerroristCount = 0
for _ in terroristsArray {
    terroristsArray[terroristCount].damage = Int.random(in: 1...5)
    terroristCount += 1
}
for _ in counterTerroristsArray {
    counterTerroristsArray[counterTerroristCount].damage = Int.random(in: 1...5)
    counterTerroristCount += 1
}

func startRound() {
   
    for _ in terroristsArray {
            terroristsArray[terroristCount].damage = Int.random(in: 1...5)
            terroristCount += 1
        }
    var terroristCount = 0
    var counterTerroristCount = 0
    for _ in terroristsArray {
        terroristsArray[terroristCount].shoot(target: &counterTerroristsArray[terroristCount])
        terroristCount += 1
        counterTerroristCount += 1
    }
    
}

// Code below work fine :)
//
//func startRound() {
//    print("Terrorists health: \(terrorist.health)")
//    print("Counterterrorists health: \(counterTerrorist.health)\n")
//    repeat {
//        terrorist.damage = Int.random(in: 1...5)
//        print("Terrorists are shoothing with \(terrorist.damage) damage...")
//        terrorist.shoot(target: &counterTerrorist)
//        if counterTerrorist.health > 0 {
//            print("Counterterorists health: \(counterTerrorist.health)\n")
//        } else {
//            print("Terrorists are win! 😀")
//            print("Counterrorists are dead! ☹️\n")
//            terrosistWins += 1
//            terrorist.health = 100
//            counterTerrorist.health = 100
//            print("""
//                Т \(terrosistWins) : \(counterTerroristWins) CT
//
//                """)
//            sleep(1)
//            break
//        }
//        counterTerrorist.damage = Int.random(in: 1...5)
//        print("Counterterrorists are shoothing with \(counterTerrorist.damage) damage...")
//        counterTerrorist.shoot(target: &terrorist)
//        if terrorist.health > 0 {
//            print("Terrorists health: \(terrorist.health)\n")
//        } else {
//            print("Counterterrorists are win! 😀")
//            print("Terrorists are dead ☹️\n")
//            counterTerroristWins += 1
//            terrorist.health = 100
//            counterTerrorist.health = 100
//            print("""
//                Т \(terrosistWins) : \(counterTerroristWins) CT
//
//                """)
//            sleep(1)
//            break
//        }
//    } while terrorist.health > 0 && counterTerrorist.health > 0
//}
//
//func startGame() {
//    repeat {
//        startRound()
//    } while terrosistWins < 16 && counterTerroristWins < 16
//    if terrosistWins == 16 {
//        print("Counterterrorists win the game! 😀")
//    } else if  counterTerroristWins == 16 {
//        print("Terrosists win the game! 😀")
//    } else {
//        print("Draw! 😡")
//    }
//
//}
//
//startGame()
