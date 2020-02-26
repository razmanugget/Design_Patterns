/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Builder
 - - - - - - - - - -
 ## 🎨 Creational Pattern
 - Important:
 • allows complex objects to be created step-by-step instead of all-at-once via a large initializer
 \
• good to use when a product requires multiple inputs
 
 > a lot of trouble. convenience initializers may be easier
 
 ![Builder Diagram](Builder_Diagram.png)
 
 - Callout(Product):
 • the complex object to be created
 
 * Callout(Builder):
 • accepts inputs step-by-step and ultimately creates the product
 
 - Callout(Director):
 • supplies the builder with step-by-step inputs and requests the builder create the product once everything has been provided
 

 
 ## Code Example
 
 */
import Foundation

// MARK: - Product
// first define hamburger with fixed components
public struct Hamburger {
   public let meat: Meat
   public let sauce: Sauces
   public let toppings: Toppings
}

// used to print later
extension Hamburger: CustomStringConvertible {
   public var description: String {
      return meat.rawValue + " burger"
   }
}

// only 1 meat allowed per burger
public enum Meat: String {
   case beef
   case chicken
   case kitten
   case tofu
}

// an OptionSet allows for multiple options
public struct Sauces: OptionSet {
   public static let mayonnaise = Sauces(rawValue: 1 << 0)
   public static let mustard = Sauces(rawValue: 1 << 1)
   public static let ketchup = Sauces(rawValue: 1 << 2)
   public static let secret = Sauces(rawValue: 1 << 3)
   
   public let rawValue: Int
   public init(rawValue: Int) {
      self.rawValue = rawValue
   }
}

public struct Toppings: OptionSet {
   public static let cheese = Toppings(rawValue: 1 << 0)
   public static let lettuce = Toppings(rawValue: 1 << 1)
   public static let pickles = Toppings(rawValue: 1 << 2)
   public static let tomatoes = Toppings(rawValue: 1 << 3)
   
   public let rawValue: Int
   public init(rawValue: Int) {
      self.rawValue = rawValue
   }
}

// MARK: - Builder
public class HamburgerBuilder {
   
   // declared as var in order to change later
   public private(set) var meat: Meat = .beef
   public private(set) var sauces: Sauces = []
   public private(set) var toppings: Toppings = []
   
   // these public methods are to allow for changes
   public func addSauces(_ sauce: Sauces) {
      sauces.insert(sauce)
   }
   public func removeSauces(_ sauce: Sauces) {
      sauces.remove(sauce)
   }
   public func addToppings(_ topping: Toppings) {
      toppings.insert(topping)
   }
   public func removeToppings(_ topping: Toppings) {
      toppings.remove(topping)
   }
   
   // private set forces validation before setting properties
   private var soldOutMeats: [Meat] = [.kitten]
   
   
   public func setMeat(_ meat: Meat) throws {
      guard isAvailable(meat) else { throw Error.soldOut }
      self.meat = meat
   }
   // custom Error defined
   public enum Error: Swift.Error {
      case soldOut
   }
   public func isAvailable(_ meat: Meat) -> Bool {
      return !soldOutMeats.contains(meat)
   }
   
   // creates the hamburger from selections
   public func build() -> Hamburger {
      return Hamburger(meat: meat,
                       sauce: sauces,
                       toppings: toppings)
   }
}

// MARK: - Director
public class Employee {
   
   public func createCombo1() throws -> Hamburger {
      let builder = HamburgerBuilder()
      try builder.setMeat(.beef)
      builder.addSauces(.secret)
      builder.addToppings([.lettuce, .tomatoes, .pickles])
      return builder.build()
   }
   
   public func createKittenSpecial() throws -> Hamburger {
      let builder = HamburgerBuilder()
      try builder.setMeat(.kitten)
      builder.addSauces(.mustard)
      builder.addToppings([.lettuce, .tomatoes])
      return builder.build()
   }
}

// MARK: - Example
let burgerFlipper = Employee()

if let combo1 = try? burgerFlipper.createCombo1() {
   print("Nom nom " + combo1.description)
}

if let kittenBurger = try?
   burgerFlipper.createKittenSpecial() {
   print("Nom nom nom " + kittenBurger.description)
} else {
   print("Sorry, no kitten burgers here... :[")
}
