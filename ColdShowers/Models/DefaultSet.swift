//
//  defaultActivities.swift
//  ColdShowers
//
//  Created by Nathan Wainwright on 2018-09-21.
//  Copyright © 2018 Kit Clark-O'Neil and Nathan Wainwright All rights reserved.
//

import UIKit
import CoreData

class DefaultSet {
  
  init() {
    
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let context = appDelegate.persistentContainer.viewContext
    
    //MARK: before posting this app to App store; all sounds/images/text need to be updated to self created content
    // all content used was for student learning purposes, and this project does not own the copyrights to the photos,
    // text, or sounds used there in.
    
    
    
    
    //MARK: sets up initial settings for workout times; only does this once on intial loading of local data
    _ = ActivityTimes(context: context, timeStrengthValue: 1.0, timeMindfulValue: 1.0, timeYogaValue: 1.0)
    
    // strength category is Int == 0
    _ = CoreActivity(context:context,
                     name: "Pushups",
                     areaOfBody: ["chest", "arms"],
                     instructions: "Keep your elbows in as you descend, then at the top, when you think you’ve pushed all the way up, push just a little more and feel your shoulder blades roll around your ribcage.",
                     category: 0,
                     photo: "pushups")
    
    _ = CoreActivity(context: context,
                     name: "Sit Ups",
                     areaOfBody: ["stomach", "legs"],
                     instructions: "Lie down on your back, keep your knees bent and your back and feet flat on the mat. Slowly lift your torso and sit up. Return to the starting position by rolling down one vertebrae at a time.",
                     category: 0,
                     photo: "situps")
    
    _ = CoreActivity(context: context,
                     name: "Crunches",
                     areaOfBody: ["stomach"],
                     instructions: "Lie down on the mat, keep your knees bent, your back and feet flat, and your hands supporting your head. Lift your shoulders, squeeze your abdominal muscles and hold it for one to two seconds. Slowly return to the starting position and repeat until set is complete.",
                     category: 0,
                     photo: "crunches")
    
    _ = CoreActivity(context: context,
                     name: "Leg Lifts",
                     areaOfBody: ["legs"],
                     instructions: "Lie supine on bench or mat. Place hands under lower buttock on each side to support pelvis. Keeping knees straight, raise legs by flexing hips until hips are completely flexed. Return until hips and knees are extended. Repeat.",
                     category: 0,
                     photo: "leglifts")
    
    _ = CoreActivity(context: context,
                     name: "Squats",
                     areaOfBody: ["legs","back"],
                     instructions: "Stand with your head facing forward and your chest held up and out. Place your feet shoulder-width apart or slightly wider. Extend your hands straight out in front of you to help keep your balance. You can also bend the elbows or clasp the fingers. Sit back and down like you're sitting into an imaginary chair. Keep your head facing forward as your upper body bends forward a bit. Rather than allowing your back to round, let your lower back arch slightly as you descend. Lower down so your thighs are as parallel to the floor as possible, with your knees over your ankles. Press your weight back into your heels. Keep your body tight, and push through your heels to bring yourself back to the starting position.",
                     category: 0,
                     photo: "squats")
    
    _ = CoreActivity(context: context,
                     name: "Plank",
                     areaOfBody: ["back","stomach", "arms"],
                     instructions: "Slowly lift your entire torso off the floor or mat, maintaining a stiff torso and legs. Avoid any arching (sagging) in your low back, hiking (upwards) in your hips or bending in the knees. Avoid shrugging your shoulder and keep your shoulders positioned directly over your elbows with your palms facing down. Continue to breath while holding this position.",
                     category: 0,
                     photo: "plank")
    
    _ = CoreActivity(context: context,
                     name: "Lunges",
                     areaOfBody: ["legs"],
                     instructions: "Keep your upper body straight, with your shoulders back and relaxed and chin up (pick a point to stare at in front of you so you don't keep looking down). Always engage your core. Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle. Make sure your front knee is directly above your ankle, not pushed out too far, and make sure your other knee doesn't touch the floor. Keep the weight in your heels as you push back up to the starting position.",
                     category: 0,
                     photo: "lunges")
    
    _ = CoreActivity(context: context,
                     name: "Pike Pushup",
                     areaOfBody: ["back","legs", "arms"],
                     instructions: "Start in a pushup position and raise your hips until you have a straight line going from your hands to your hips. Keep your elbows in as you descend, drive yourself back up and keep your hips up the entire time.",
                     category: 0,
                     photo: "pikePushUp")
    
    _ = CoreActivity(context: context,
                     name: "Bear Crawl",
                     areaOfBody: ["back","arms"],
                     instructions: "Get on all fours with your hands under your shoulders and your knees under your hips; keep your knees an inch above the ground. Crawl forward by taking a small step with your right arm and left leg at the same time and alternate. Keep your hips low and your head up.",
                     category: 0,
                     photo: "bearcrawl")
    
    _ = CoreActivity(context: context,
                     name: "Hip/Thigh Extension",
                     areaOfBody: ["legs","stomach"],
                     instructions: "Lie on your back in a bridge position and bend one knee so that it makes a 90-degree angle to the floor and stick the opposite leg straight out — knees aligned. With your bent leg, squeeze your glute, push through your heel, push your hips up and keep your hips level as you rise. Keep your straight leg extended throughout the exercise and keep it inline with your torso. ",
                     category: 0,
                     photo:"hipthigh")
    
    // mindful category is Int == 1
    _ = CoreActivity(context: context,
                     name: "Focus on a Single Minute",
                     areaOfBody: ["mind","soul"],
                     instructions: "Find a comfortable place to sit where you will be undisturbed. Now, without looking at the timer, simply sit.  When you believe one minute has passed, stop the timer. Notice how much time has actually passed. What insight did you gain from this simple exercise?",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Focus on a Single Object",
                     areaOfBody: ["mind","soul"],
                     instructions: "Choose an object to focus on and, without touching it, begin looking at the object with mindful awareness.  Take your time to notice all aspects of this object: shape, texture, color, etc.  Now, hold it in your hand and notice the different ways that it feels.  If your attention wanders during this exercise, gently bring your focus back to the object.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Band of Light",
                     areaOfBody: ["mind","soul"],
                     instructions: "Find a comfortable place to sit where you won’t be distracted.  Use your imagination to envision a narrow band of white light encircling the top of your head like a halo.  Now imagine this band of light slowly moving down your body, becoming mindfully aware of the physical sensations of each part of your body as the band of light progresses down.  If your attention wanders, just gently direct it back to the physical sensations you experience as the light moves from the top of your head all the way down to your toes.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Inner-Outer Experience",
                     areaOfBody: ["mind","soul"],
                     instructions: "Try shifting your attention back and forth between your internal experience (i.e., bodily sensations, thoughts, and feelings) and your external experience (i.e., what you notice with your eyes, ears, nose, and sense of touch).",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Record Three Minutes of Thoughts",
                     areaOfBody: ["mind","soul"],
                     instructions: "Try setting a timer for three minutes and simply begin to write down every thought that goes through your mind on a piece of paper.  Don’t try to edit your thoughts or write them out word for word, just record each idea or concept that occurs to you.  An example of a thought might be about an important upcoming presentation. Rather than writing out specific details about the presentation, simply write “presentation.”  See how many thoughts you can record in three minutes, no matter how small or seemingly unimportant.  When you are finished, count the number of thoughts that you had in those three minutes and multiply that number by twenty to get a sense of how many thoughts you tend to have in a whole hour.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Thought Defusion",
                     areaOfBody: ["mind","soul"],
                     instructions: "Thought defusion can help you mindfully observe these distressing thoughts without getting bogged down by them.  Ultimately, it can allow you the freedom to consciously select which thoughts you wish to focus on and which thoughts you would like to let go. The idea of this exercise is to visualize your thoughts (e.g., as pictures, words, or symbols) harmlessly floating away from you.  Try imagining your thoughts as leaves floating past you on a slowly moving river.  If any particular thoughts keep coming up, just allow them to pass by again – notice them, observe them, and let them go.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Describe Your Emotion",
                     areaOfBody: ["mind","soul"],
                     instructions: "Try picking an emotion – it can be pleasant or unpleasant, but not so overwhelming that you worry about feeling out of control.  Ideally, choose an emotion that you are experiencing right now.  Once you have an emotion in mind, write it down on a piece of paper.  Begin by naming the emotion and then continue with the exercise by drawing a picture that you believe represents this emotion for you. Next, try writing down a related action and sound for the emotion.  Notice what you are experiencing throughout the exercise.  If you feel overwhelmed at any point, pause momentarily and bring your focus gently back to the exercise.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Focus Shifting",
                     areaOfBody: ["mind","soul"],
                     instructions: "Begin by checking in with yourself to identify how you are feeling. If you think you’re feeling “nothing,” try giving that emotional experience a label … it could even be “bored” or “content.”  Close your eyes and bring your attention towards your current emotional experience – what would this emotion look like if it was an object?  Imagine this object.  Now, open your eyes and redirect your focus towards a physical object in the room.  Mindfully observe this object.  If your attention begins to wander, just gently bring it back to the exercise. Return your focus towards your internal emotional experience.  Next, shift your mindful awareness towards another sensory experience in the room – perhaps noticing a particular sound or smell. ",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Mindful Breathing",
                     areaOfBody: ["mind","soul"],
                     instructions: "To breathe mindfully, focus on three parts of the experience: count your breaths, focus on the physical act of breathing, and be aware of any thoughts that arise while breathing.  Remember what you learned in the thought defusion exercise to let go of distracting thoughts without getting “stuck” on them.",
                     category: 1,
                     photo:"mindful")
    
    _ = CoreActivity(context: context,
                     name: "Mindful Seeing",
                     areaOfBody: ["mind","soul"],
                     instructions: "Find a space at a window where there are sights to be seen outside. Look at everything there is to see.  Avoid labeling and categorizing what you see outside the window; instead of thinking “bird” or “stop sign”, try to notice the colors, the patterns, or the textures. Pay attention to the movement of the grass or leaves in the breeze, notice the many different shapes present in this small segment of the world you can see.  Try to see the world outside the window from the perspective of someone unfamiliar with these sights. Be observant, but not critical.  Be aware, but not fixated. If you become distracted, gently pull your mind away from those thoughts and notice a color or shape again to put you back in the right frame of mind.",
                     category: 1,
                     photo:"mindful")
    
    // yoga category is Int == 2
    _ = CoreActivity(context: context,
                     name: "Mountain Pose",
                     areaOfBody: ["legs", "arms"],
                     instructions: "This pose is excellent for giving a warm-up stretch to the entire body from neck to toe.",
                     category: 2,
                     photo:"mountain")
    
    _ = CoreActivity(context: context,
                     name: "Tree Pose",
                     areaOfBody: ["legs"],
                     instructions: "Move into the pose, by lifting the left leg and placing it on the inner right thigh. Balance your body and mind until your body stands firm like the tree on the right leg. Focus on the breath and lift both your arms into the air above the head to join your hands.",
                     category: 2,
                     photo:"tree")
    
    _ = CoreActivity(context: context,
                     name: "Child's Pose",
                     areaOfBody: ["legs","arms"],
                     instructions: "Relax like a child with this pose and let the worries of the world fade away in it. The pose not only helps your body relax but also stills the mind and aligns it with the center of your heart.",
                     category: 2,
                     photo:"child")
    
    _ = CoreActivity(context: context,
                     name: "Downward Facing Dog",
                     areaOfBody: ["legs","back", "arms"],
                     instructions: "The pose is one of the most followed yoga stretches for beginners. Pull yourself into an ‘Inverted-V’ position and feel a thorough stretch and tone in the spine, legs, calves, and hamstrings. While the steadiness required in maintaining the composure in this pose contributes to building strength and balance.",
                     category: 2,
                     photo:"downwarddog")
    
    _ = CoreActivity(context: context,
                     name: "Warrior I",
                     areaOfBody: ["legs","arms"],
                     instructions: "Start in a standing position with your hands upwards, inhale slowly during this. As you exhale, step your left foot back about four feet, so you’re in a lunge position with the right ankle over the right knee. Raise your arms straight overhead, biceps by ears, and turn your left foot about 90 degrees to face the left wall. Align your left heel perpendicular with your right heel. Expand your chest and pull your shoulders back, then lower down toward the floor as you lift your arms up. Make sure your hips stay square to the front, as you continue to breathe.",
                     category: 2,
                     photo:"warriorOne")
    
    _ = CoreActivity(context: context,
                     name: "Triangle Pose",
                     areaOfBody: ["legs","back"],
                     instructions: "Stand up straight, and place your feet slightly more than shoulder width apart. The Triangle is a lateral stretch for your trunk muscles and spine, and makes your hips, legs, and shoulders more flexible. Stretch your right arm up, then bend to your left, sliding your left hand down your thigh. Do not twist your body. Hold for 30 seconds, working up to 2 minutes with practice. Inhale as you straighten up again. Repeat the pose on the other side. Your body forms a straight line, parallel to the floor. from your waist to your fingertips.",
                     category: 2,
                     photo:"triangle")
    
    _ = CoreActivity(context: context,
                     name: "Chair Pose",
                     areaOfBody: ["legs","back", "arms"],
                     instructions: "Start in a standing position with your hands upwards, inhale slowly during this. Inhale and raise your arms perpendicular to the floor. Either keep the arms parallel, palms facing inward, or join the palms. Exhale and bend your knees, trying to take the thighs as nearly parallel to the floor as possible. The knees will project out over the feet, and the torso will lean slightly forward over the thighs until the front torso forms approximately a right angle with the tops of the thighs. Keep the inner thighs parallel to each other and press the heads of the thigh bones down toward the heels. Firm your shoulder blades against the back. Take your tailbone down toward the floor and in toward your pubis to keep the lower back long. Stay for thirty seconds to a minute. To come out of this pose straighten your knees with an inhalation, lifting strongly through the arms. Exhale and release your arms to your sides into the starting position.",
                     category: 2,
                     photo:"chair")
    
    _ = CoreActivity(context: context,
                     name: "Cobra Pose",
                     areaOfBody: ["back","arms"],
                     instructions: "Rest on the mat on your stomach and raise the upper body to the curvature of the spine. Experience a deep stretch in the torso and the legs as you perform it. Close your eyes and remain in the pose for a few seconds for complete relaxation of the mind.",
                     category: 2,
                     photo:"cobra")
    
    _ = CoreActivity(context: context,
                     name: "Cobbler’s Pose",
                     areaOfBody: ["legs"],
                     instructions: "Sit on the mat in the position of the Cobbler, the soles of your feet aligned with each other. While grasping the feet with your hands flap your thighs like the wings of a butterfly. An excellent pose to release even the most dormant muscles in the lower body while strengthening the spine.",
                     category: 2,
                     photo:"cobbler")
    
    _ = CoreActivity(context: context,
                     name: "Corpse Pose",
                     areaOfBody: ["body","mind"],
                     instructions: "Spare a few minutes into this pose and let your mind, body, and soul sink in perfect harmony with each other before you head out for the day – feeling completely relaxed and rejuvenated.",
                     category: 2,
                     photo:"corpse")
    
    appDelegate.saveContext()
  }
}

extension CoreActivity {
  convenience init(context: NSManagedObjectContext, name: String, areaOfBody: [String], instructions: String, category: Int, photo: String) {
    
    //(name: "Pushups", areaOfBody: ["chest", "arms"], instructions: "pushups", category: .strength, photo: "pushups")
    self.init(context: context)
    self.name = name
    self.areaOfBody = areaOfBody as NSArray
    self.instructions = instructions
    self.category = Int64(category)
    self.photo = photo
    
    self.originalIndex = 0
    self.settings = true
    self.intensity = 0
    self.occurance = 0
  }
}

extension ActivityTimes {
  convenience init(context: NSManagedObjectContext, timeStrengthValue: Float, timeMindfulValue: Float, timeYogaValue: Float) {
    self.init(context: context)
    self.timeStrengthValue = timeStrengthValue
    self.timeMindfulValue = timeMindfulValue
    self.timeYogaValue = timeYogaValue
  }
}


