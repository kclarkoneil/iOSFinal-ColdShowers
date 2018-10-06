//
//  ActivityListManager.swift
//  ColdShowers
//
//  Created by Nathan Wainwright on 2018-09-23.
//  Copyright © 2018 Kit Clark-O'Neil and Nathan Wainwright All rights reserved.
//

import UIKit
import CoreData

class ActivityListManager: NSObject {
  
  var activities: [CoreActivity] = []
  var strength: [CoreActivity] = []
  var mindful: [CoreActivity] = []
  var yoga: [CoreActivity] = []
  
  var currentYoga: [CoreActivity] = []
  var currentStrength: [CoreActivity] = []
  var currentMindful: [CoreActivity] = []
  
  let list: [CoreActivity] = []
  
  override init() {
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    let context = appDelegate.persistentContainer.viewContext
    
    //  this is a rough example of how to save in background.... HARD TO ensure it's working
    //    appDelegate.persistentContainer.performBackgroundTask { (context) in
    //      context.save()
    //    }
    let allActivities = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let sort = NSSortDescriptor(key: #keyPath(CoreActivity.category), ascending: true)
    allActivities.sortDescriptors = [sort]
    do {
      activities = try context.fetch(allActivities)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    let allStrength = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let sortStrength = NSSortDescriptor(key: "name", ascending: true)
    allStrength.sortDescriptors = [sortStrength]
    allStrength.predicate = NSPredicate(format: "category == 0")
    do {
      strength = try context.fetch(allStrength)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    let allMindFul = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let sortMindful = NSSortDescriptor(key: "name", ascending: true)
    allMindFul.sortDescriptors = [sortMindful]
    allMindFul.predicate = NSPredicate(format: "category == 1")
    do {
      mindful = try context.fetch(allMindFul)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    let allYoga = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let sortYoga = NSSortDescriptor(key: "name", ascending: true)
    allYoga.sortDescriptors = [sortYoga]
    allYoga.predicate = NSPredicate(format: "category == 2")
    do {
      yoga = try context.fetch(allYoga)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    //MARK: Filtering activites based on how many times they have been done, but also if user doesn't want them at all.
    var occurancesStrength: [NSNumber] = []
    for item in strength {
      let contains = occurancesStrength.contains { (occurance) -> Bool in
        return item.occurance == occurance.int64Value
      }
      if !contains {
        occurancesStrength.append(NSNumber.init(value: item.occurance))
      }
    }
    
    let uniqueStrength = [occurancesStrength.first!]
    
    let finalStrengthFetch = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let categoryStrength = NSPredicate(format: "category == 0")
    let settingStrength = NSPredicate(format: "settings == %@", NSNumber(value: true))
    
    let occurenceStrength = NSPredicate(format: "occurance IN %@", argumentArray: [uniqueStrength]) // leave in, further expansion
    
    let compoundStrength = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryStrength, settingStrength])
    
    
    finalStrengthFetch.predicate = compoundStrength
    do {
      let finalStrength = try context.fetch(finalStrengthFetch)
      currentStrength = finalStrength
    } catch let error as NSError {
      print("Could not fetch. FinalYogaFetch \(error), \(error.userInfo)")
    }
    
    var occurancesMindful: [NSNumber] = []
    for item in mindful {
      let contains = occurancesMindful.contains { (occurance) -> Bool in
        return item.occurance == occurance.int64Value
      }
      if !contains {
        occurancesMindful.append(NSNumber.init(value: item.occurance))
      }
    }
    
    let uniqueMindful = [occurancesMindful.first!]
    
    let finalMindfulFetch = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let categoryMindful = NSPredicate(format: "category == 1")
    let settingMindFul = NSPredicate(format: "settings == %@", NSNumber(value: true))
    let occurenceMindful = NSPredicate(format: "occurance IN %@", argumentArray: [uniqueMindful]) // leave in, further expansion
    
    let compoundMindful = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryMindful, settingMindFul])
    finalMindfulFetch.predicate = compoundMindful
    do {
      let finalMindful = try context.fetch(finalMindfulFetch)
      currentMindful = finalMindful
    } catch let error as NSError {
      print("Could not fetch. FinalYogaFetch \(error), \(error.userInfo)")
    }
    
    var occurancesYoga: [NSNumber] = [] /// e.g. [0, 2, 5, 6]
    
    for item in yoga {
      let contains = occurancesYoga.contains { (occurance) -> Bool in
        return item.occurance == occurance.int64Value
      }
      if !contains {
        occurancesYoga.append(NSNumber.init(value: item.occurance))
      }
    }
    
    let uniqueYoga = [occurancesYoga.first!]
    
    let finalYogaFetch = NSFetchRequest<CoreActivity>(entityName: "CoreActivity")
    let categoryYoga = NSPredicate(format: "category == 2")
    
    let settingYoga = NSPredicate(format: "settings == %@", NSNumber(value: true))
    
    let occuranceYoga = NSPredicate(format: "occurance IN %@", argumentArray: [uniqueYoga]) // leave in, further expansion
    
    let compoundYoga = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryYoga, settingYoga])
    finalYogaFetch.predicate = compoundYoga
    do {
      let finalYoga = try context.fetch(finalYogaFetch)
      currentYoga = finalYoga
    } catch let error as NSError {
      print("Could not fetch. FinalYogaFetch \(error), \(error.userInfo)")
    }
  }
  
  // MARK: activity list function
  func getNewList() -> [CoreActivity] {
    
    
    
    let actOne = currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    let actTwo = currentMindful[Int(arc4random_uniform(UInt32(currentMindful.count)) + 0)]
    let actThree = currentYoga[Int(arc4random_uniform(UInt32(currentYoga.count)) + 0)]
    let actFour = currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    let actFive = currentMindful[Int(arc4random_uniform(UInt32(currentMindful.count)) + 0)]
    let actSix = currentYoga[Int(arc4random_uniform(UInt32(currentYoga.count)) + 0)]
    let actSeven = currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    let actEight = currentMindful[Int(arc4random_uniform(UInt32(currentMindful.count)) + 0)]
    let actNine = currentYoga[Int(arc4random_uniform(UInt32(currentYoga.count)) + 0)]
    let actTen = currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    
    
    
    
    
    
    //    list: = [actOne, actTwo, actThree, actFour, actFive, actSix, actSeven, actEight, actNine, actTen]
    return [actOne, actTwo, actThree, actFour, actFive, actSix, actSeven, actEight, actNine, actTen]
  }
  
  
  func getList(_ amount: Int) -> [CoreActivity] { // change to -> [CoreActivity]
    
    let catagoryRandom = Int(arc4random_uniform(6) + 1)
    
    
    var returnList: [CoreActivity] = []
    var counter:Int = 0
    // ONLY USE NUMBERS 1-6 FOR THIS FUNCTION
    
    while counter < amount {
      returnList.append(getRandomAct(Int(arc4random_uniform(6) + 1)))
      counter += 1
    }
    
    
    
    return returnList // change to coreactivity
  }
  
  func getRandomAct(_ number: Int) -> CoreActivity {
    
    switch number {
    case 1:
      return currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    case 2:
      return currentMindful[Int(arc4random_uniform(UInt32(currentMindful.count)) + 0)]
    case 3:
      return currentYoga[Int(arc4random_uniform(UInt32(currentYoga.count)) + 0)]
    case 4:
      return currentStrength[Int(arc4random_uniform(UInt32(currentStrength.count)) + 0)]
    case 5:
      return currentMindful[Int(arc4random_uniform(UInt32(currentMindful.count)) + 0)]
    case 6:
      return currentYoga[Int(arc4random_uniform(UInt32(currentYoga.count)) + 0)]
    default:
      fatalError("Input number, \(number) is out of bounds, needs to between 1-6")
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
