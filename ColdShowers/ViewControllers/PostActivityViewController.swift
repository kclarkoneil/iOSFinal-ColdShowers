//
//  PostActivityViewController.swift
//  ColdShowers
//
//  Created by Kit Clark-O'Neil on 2018-09-20.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//
import UIKit

class PostActivityViewController: UIViewController {
  
  //MARK: Storyboard Properties
  @IBOutlet weak var intensityLabel: UILabel!
  @IBOutlet weak var intensityButtonLow: UIButton!
  @IBOutlet weak var intensityButtonMiddle: UIButton!
  @IBOutlet weak var intensityButtonHigh: UIButton!
  
  @IBOutlet weak var enjoymentLabel: UILabel!
  @IBOutlet weak var enjoymentButtonYes: UIButton!
  @IBOutlet weak var enjoymentButtonNo: UIButton!
  
  @IBOutlet weak var activityButtonFinish: UIButton!
  
  //MARK: properties
  let defaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  // MARK: Button Actions
  @IBAction func activityButtonFinishPressed(_ sender: UIButton) {
    addNewDashDate()
    performSegue(withIdentifier: "backHomeSegue", sender: self)
  }
  //MARK: Dash Handling
  func addNewDashDate() {
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "yyyy-MM-dd"
    formatter1.timeZone = TimeZone(secondsFromGMT: 0)
    
    let todayDateString = formatter1.string(from: Date())
    let todayDate = formatter1.date(from: todayDateString)
    let calendar = NSCalendar.current
    
    let lastDateString = defaults.string(forKey: "lastActivityListDone")
    let lastDate = formatter1.date(from: lastDateString!)
    
    var currentStreak = defaults.integer(forKey: "currentStreak")
    
    var userActivityHistory = defaults.array(forKey: "userActivityHistory")  as? [String] ?? ["ERROR NO DATES FOUND"]
    
    // ERROR HANDLING -- KEEP FOR REFERENCE
    //    if userActivityHistory.count < 1 {
    //      defaults.set(newDate, forKey: "userActivityHistory")
    //    } else {
    //      let currentDateString = userActivityHistory.last
    //      guard let currentDate = formatter1.date(from: currentDateString!) else {
    //        fatalError()
    //      }
    //    }
    
    let dateBool = calendar.isDate(todayDate!, inSameDayAs: lastDate!)
    if dateBool == false {
      userActivityHistory.append(todayDateString)
      currentStreak += 1
      
      defaults.set(todayDateString, forKey: "lastActivityListDone")
      defaults.set(userActivityHistory, forKey: "userActivityHistory")
      defaults.set(currentStreak, forKey: "currentStreak")
    }
  }
}
