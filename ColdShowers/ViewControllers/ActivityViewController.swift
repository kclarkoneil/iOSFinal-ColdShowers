//
//  ActivityViewController.swift
//  ColdShowers
//
//  Created by Kit Clark-O'Neil on 2018-09-20.
//  Copyright © 2018 Kit Clark-O'Neil and Nathan Wainwright All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
  
  //MARK: ActivityView -- Timer Overlay Properties
  @IBOutlet weak var timerOverlayView: UIView!
  @IBOutlet weak var timerOverlaylabel: UILabel!
  @IBOutlet weak var timerOverlayButton: UIButton!
  
  //MARK: ActivityView Properties
  @IBOutlet weak var activityNameLabel: UILabel!
  @IBOutlet weak var estimatedTimeLabel: UILabel!
  @IBOutlet weak var estimatedTimeAmount: UILabel!
  @IBOutlet weak var activityInstructionImage: UIImageView!
  @IBOutlet weak var activityStartButton: UIButton!
  @IBOutlet weak var activityCancelButton: UIButton!
  @IBOutlet weak var activityCurrentTimerLabel: UILabel!
  @IBOutlet weak var activityInstructionLabel: UILabel!
  
  
  @IBOutlet weak var activityInstructionButton: UIButton!
  @IBOutlet weak var activityInstructionTextView: UITextView!
  
  var instructionSetting = true
  
  
  //MARK: Varible Properties
  var currentActivity:Int = 0
  var activityList = Array<CoreActivity>()
  
  //MARK: SoundManager
  let soundManager = SoundManager()
  
  //MARK: Time Manager
  let timeManager = ActivityTimeManager()
  
  //MARK: Activity Manager
  let activityManager = ActivityListManager()
  let hour = 0
  var minutes = 5
  
  var rootSeconds:Float = 90.0 // 1.5mins
  var seconds:Float = 90.0 // 1.5mins
  var timer = Timer()
  var isTimerRunning = false // used to ensure only one timer running at any given time
  
  let formatter = DateFormatter()
  var activityTotalTime = Date()
  
  //MARK: Local Data
  let defaults = UserDefaults.standard
  
//  //MARK: getting default time allotments for activities from userdefault
//  var timeStrengthValue:Float = 0.0
//  var timeMindfulValue:Float = 0.0
//  var timeYogaValue:Float = 0.0
  
  var timePerActivity:Float = 90 // 1.5mins
  

  override func viewDidLoad() {
    super.viewDidLoad()
    activityInstructionTextView.isHidden = true
    
    timerOverlaylabel.text = timeString(time: TimeInterval(timePerActivity))
//    timeStrengthValue = 60 * timeManager.getTime("Strength")
//    timeMindfulValue = 60 * timeManager.getTime("Mindful")
//    timeYogaValue = 60 * timeManager.getTime("Yoga")
    
    activityList = activityManager.getNewList()
    //MARK: get all times for all activities
    // as all activities are 1.5 mins long now
    // MARK: NON DYNAMIC DATA
    // 15 mins is being used for ALL total workouts, * 60 gets total seconds
    // each activity is 1.5 mins long
    estimatedTimeAmount.text = timeString(time: TimeInterval(timePerActivity * 10))
    
    
    // need function that feeds in activity list
    
    // first step is just gettting length of array
    
    
//    estimatedTimeAmount.text = timeString(time: TimeInterval(timeMindfulValue + timeYogaValue + timeStrengthValue))
    
    
    //    // user default methods
    //    timeStrengthValue = 60 * defaults.integer(forKey: "timeStrengthValue")
    //    timeMindfulValue = 60 * defaults.integer(forKey: "timeMindfulValue")
    //    timeYogaValue = 60 * defaults.integer(forKey: "timeYogaValue")
    
    
    
    
    
    
//    switch self.currentActivity {
//    case 0:
//      self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeStrengthValue))
//      self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeStrengthValue))
//      self.rootSeconds = self.timeStrengthValue
//      self.seconds = self.timeStrengthValue
//    case 1:
//      self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeMindfulValue))
//      self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeMindfulValue))
//      self.rootSeconds = self.timeMindfulValue
//      self.seconds = self.timeMindfulValue
//    case 2:
//      self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeYogaValue))
//      self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeYogaValue))
//      self.rootSeconds = self.timeYogaValue
//      self.seconds = self.timeYogaValue
//    default:
//      fatalError("TIME VALUE ERROR")
//    }
    
    //MARK: will keep the workout screen active.
    UIApplication.shared.isIdleTimerDisabled = true
    
    timerOverlayView.isHidden = true
    timerOverlayView.alpha = 0.0
    
    
    
    //    MakeBorder.addTopBorder(inpView: activityInstructionImage, withColor: UIColor.offWhite)
    //    MakeBorder.addBottomBorder(inpView: activityInstructionImage, withColor: UIColor.offWhite)
    //    MakeBorder.addBottomBorder(inpView: timerOverlayView, withColor: UIColor.jetBlack)
    //    MakeBorder.addTopBorder(inpView: timerOverlayView, withColor: UIColor.jetBlack)
    
    loadData()
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
  
  //MARK: Button Actions
  
  @IBAction func activityInstructionButtonPressed(_ sender: UIButton) {
    if instructionSetting {
      activityInstructionTextView.isHidden = true
    } else {
      activityInstructionTextView.isHidden = false
    }
    instructionSetting = !instructionSetting
  }
  
  override func viewDidAppear(_ animated: Bool) {
    // loading this here, as on plus model phones it doesn't display properly.
    MakeBorder.addTopBorder(inpView: activityInstructionImage, withColor: UIColor.offWhite)
    MakeBorder.addBottomBorder(inpView: activityInstructionImage, withColor: UIColor.offWhite)
    MakeBorder.addBottomBorder(inpView: timerOverlayView, withColor: UIColor.jetBlack)
    MakeBorder.addTopBorder(inpView: timerOverlayView, withColor: UIColor.jetBlack)
  }
  
  
  
  
  @IBAction func activityStartButtonPressed(_ sender: UIButton) {
    
    UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseOut, animations: {
      self.timerOverlayView.alpha = 1.0
      self.activityStartButton.alpha = 0.0
      self.activityCancelButton.alpha = 0.0
    }, completion: nil)
    activityStartButton.isEnabled = false
    activityCancelButton.isEnabled = false
    activityStartButton.isHidden = true
    activityCancelButton.isHidden = true
    timerOverlayView.isHidden = false
    activityInstructionButton.isEnabled = false
    activityInstructionTextView.isHidden = true
    
    self.runTimer()
  }
  
  @IBAction func activityCancelButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "backHome", sender: nil)
  }
  
  @IBAction func timerOverlayButtonPressed(_ sender: UIButton) {
    
    
    UIView.animate(withDuration: 0.8, animations: {
      self.timerOverlayView.alpha = 0.0
      self.activityStartButton.alpha = 1.0
      self.activityCancelButton.alpha = 1.0
    }) { (true) in
      // runs this code once animation has finished; which includes the segue to the next screen if user has done all activities
      
      
      self.timerOverlayView.isHidden = true
      self.activityStartButton.isEnabled = true
      self.activityCancelButton.isEnabled = true
      self.activityStartButton.isHidden = false
      self.activityCancelButton.isHidden = false
      self.activityInstructionButton.isEnabled = true
      self.activityInstructionTextView.isHidden = true
      self.activityList[self.currentActivity].occurance += 1
      
      self.timer.invalidate()
      
      
      
//      if self.activityList[self.currentActivity].category == 0 {
//        self.seconds = self.timeStrengthValue
//        self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeStrengthValue))
//      } else if self.activityList[self.currentActivity].category == 1 {
//        self.seconds = self.timeMindfulValue
//        self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeMindfulValue))
//      } else if self.activityList[self.currentActivity].category == 2 {
//        self.seconds = self.timeYogaValue
//        self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeYogaValue))
//      } else {
//        // DO NOTHING
//      }
      
      
      
      if self.currentActivity < (self.activityList.count - 1) {
        self.currentActivity += 1
        
        self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timePerActivity))
        self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timePerActivity))
        self.rootSeconds = self.timePerActivity
        self.seconds = self.timePerActivity
        
        
        
        
        
        
//        switch self.currentActivity {
//        case 0:
//          self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeStrengthValue))
//          self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeStrengthValue))
//          self.rootSeconds = self.timeStrengthValue
//          self.seconds = self.timeStrengthValue
//        case 1:
//          self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeMindfulValue))
//          self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeMindfulValue))
//          self.rootSeconds = self.timeMindfulValue
//          self.seconds = self.timeMindfulValue
//        case 2:
//          self.timerOverlaylabel.text = self.timeString(time: TimeInterval(self.timeYogaValue))
//          self.activityCurrentTimerLabel.text = self.timeString(time: TimeInterval(self.timeYogaValue))
//          self.rootSeconds = self.timeYogaValue
//          self.seconds = self.timeYogaValue
//        default:
//          fatalError("TIME VALUE ERROR")
//        }
        
        
        self.loadData()
      } else {
        self.performSegue(withIdentifier: "postActivitySegue", sender: self)
      }
      
      
      
    }
  }
  
  //MARK: Load Data for Labels
  func loadData() {
    
    
    activityNameLabel.text = activityList[currentActivity].name
    activityInstructionImage.image = UIImage(named: activityList[currentActivity].photo!)
    //    activityInstructionLabel.text = activityList[currentActivity].instructions
    activityInstructionTextView.text = activityList[currentActivity].instructions
    
    activityCurrentTimerLabel.text = timeString(time: TimeInterval(timePerActivity))
    
  }
  
  //MARK: TIMER FUNCTIONS
  func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ActivityViewController.updateTimer)), userInfo: nil, repeats: true)
  }
  
  @objc func updateTimer() {
    self.seconds -= 1     //This will decrement(count down)the seconds.
    self.timerOverlaylabel.text = timeString(time: TimeInterval(self.seconds)) //This will update the label.
    
    if seconds == 0 {
      timerOverlayButtonPressed(timerOverlayButton)
      soundManager.doneActivity()
    } 
  }
  
  func timeString(time:TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    let timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    return timeString
  }
}


