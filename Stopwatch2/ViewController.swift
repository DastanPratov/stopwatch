//
//  ViewController.swift
//  Stopwatch2
//
//  Created by Dastan on 15/6/22.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startbutton.isEnabled = true
        
        resetButton.alpha = 0.1
        startbutton.alpha = 1.0
        pauseButton.alpha = 0.1
    }
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0

    @IBAction func resetDidTap(_ sender: Any)
    {
        timer.invalidate()
        isTimerRunning = false
        counter = 0
        timerLabel.text = "00:00:00"
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startbutton.isEnabled = true
        
        resetButton.alpha = 0.5
        startbutton.alpha = 1.0
        pauseButton.alpha = 0.5
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
        resetButton.isEnabled = true
        startbutton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
        
        resetButton.alpha = 1.0
        startbutton.alpha = 1.0
        pauseButton.alpha = 0.5
    }
    
    @IBAction func startDidTap(_ sender: Any)
    {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startbutton.isEnabled = false
            
            resetButton.alpha = 1.0
            startbutton.alpha = 0.5
            pauseButton.alpha = 1.0
        }
    }
    @objc func runTimer()
    {
        counter += 1
        timerLabel.text = "\(counter)"
        
        let flooredCounter = Int(Float(counter))
        
        let hour = flooredCounter / 3600
        var hourString = "\(hour)"
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        
        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }
}

