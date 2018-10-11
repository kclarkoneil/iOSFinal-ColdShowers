//
//  TimerManager.swift
//  ColdShowers
//
//  Created by Nathan Wainwright on 2018-09-28.
//  Copyright © 2018 Kit Clark-O'Neil and Nathan Wainwright All rights reserved.
//

import UIKit
import CoreData

class ActivityTimeManager: NSObject {

  var hour = 00
  var minutes = 15
  var seconds = 00
  
  var context:NSManagedObjectContext?
  
 
    var desiredIntensity: [UserDesiredIntensity] = []
  
  override init() {
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    context = appDelegate.persistentContainer.viewContext
    
   
    let intensityRequest = NSFetchRequest<UserDesiredIntensity>(entityName: "UserDesiredIntensity")

    
    do {
        guard let intensity = (try context?.fetch(intensityRequest)) else {
            desiredIntensity[0].desiredIntensity = 1
            do {
                try context?.save()
            } catch {
                fatalError("Failed saving")
            }
            return
        }
        desiredIntensity = intensity
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    }

  func getTime(_ category: String) -> Float {
    var timeValue:Float = 0.0
    if category == "Average Intensity" {
        timeValue = Float(desiredIntensity[0].desiredIntensity)
    }
    
    else {
      timeValue = 666.0
    }
    return timeValue
  }
  
  func setTime(_ category: String, value: Float) {
    
    if category == "Average Intensity" {
        desiredIntensity[0].desiredIntensity = Int64(value)
    }
    else {
      fatalError("ERROR WITH CATEGORY OR VALUE")
    }
    
    do {
      try context?.save()
    } catch {
      fatalError("Failed saving")
    }
  }
}

