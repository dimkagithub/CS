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

var terrorist = Terrorist() as Shootable
var counterTerrorist = CounterTerrorist() as Shootable
var terrosistWins: Int = 0
var counterTerroristWins: Int = 0

print("""
    Т \(terrosistWins) : \(counterTerroristWins) CT
    
    """)

func startRound() {
    print("Terrorists health: \(terrorist.health)")
    print("Counterterrorists health: \(counterTerrorist.health)\n")
    repeat {
        terrorist.damage = Int.random(in: 1...5)
        print("Terrorists are shoothing with \(terrorist.damage) damage...")
        terrorist.shoot(target: &counterTerrorist)
        if counterTerrorist.health > 0 {
            print("Counterterorists health: \(counterTerrorist.health)\n")
        } else {
            print("Terrorists are win! 😀")
            print("Counterrorists are dead! ☹️\n")
            terrosistWins += 1
            terrorist.health = 100
            counterTerrorist.health = 100
            print("""
                Т \(terrosistWins) : \(counterTerroristWins) CT
                
                """)
            sleep(1)
            break
        }
        counterTerrorist.damage = Int.random(in: 1...5)
        print("Counterterrorists are shoothing with \(counterTerrorist.damage) damage...")
        counterTerrorist.shoot(target: &terrorist)
        if terrorist.health > 0 {
            print("Terrorists health: \(terrorist.health)\n")
        } else {
            print("Counterterrorists are win! 😀")
            print("Terrorists are dead ☹️\n")
            counterTerroristWins += 1
            terrorist.health = 100
            counterTerrorist.health = 100
            print("""
                Т \(terrosistWins) : \(counterTerroristWins) CT
                
                """)
            sleep(1)
            break
        }
    } while terrorist.health > 0 && counterTerrorist.health > 0
}

func startGame() {
    repeat {
        startRound()
    } while terrosistWins < 16 && counterTerroristWins < 16
    if terrosistWins == 16 {
        print("Counterterrorists win the game! 😀")
    } else if  counterTerroristWins == 16 {
        print("Terrosists win the game! 😀")
    } else {
        print("Draw! 😡")
    }
    
}

startGame()
