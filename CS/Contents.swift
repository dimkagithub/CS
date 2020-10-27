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

print("Terrorist health: \(terrorist.health)")
print("Counterterroris health: \(counterTerrorist.health)\n")


terrorist.damage = Int.random(in: 1...5)
print("Terrorist is shoothing with \(terrorist.damage) damage...")
terrorist.shoot(target: &counterTerrorist)
if counterTerrorist.health > 0 {
    print("Counterterrorist health: \(counterTerrorist.health)\n")
} else {
    print("Countterrorist is dead :(\n")
}

counterTerrorist.damage = Int.random(in: 1...5)
print("Counterterrorist is shoothing with \(counterTerrorist.damage) damage...")
counterTerrorist.shoot(target: &terrorist)
if terrorist.health > 0 {
    print("Terrorist health: \(terrorist.health)\n")
} else {
    print("Terrorist is dead :(\n")
}
