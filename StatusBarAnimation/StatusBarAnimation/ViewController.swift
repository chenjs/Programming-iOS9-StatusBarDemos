//
//  ViewController.swift
//  StatusBarAnimation
//
//  Created by chenjs on 16/1/22.
//  Copyright © 2016年 chenjs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    var isHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellowColor()
        self.textView.backgroundColor = UIColor.greenColor()
    }

    override func prefersStatusBarHidden() -> Bool {
        return isHidden
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        // .None:
        // .Slide:
        // .Fade
        return UIStatusBarAnimation.Slide
    }
    
    @IBAction func toggleStatusBarState(sender: UIButton) {
        isHidden = !isHidden
        
        UIView.animateWithDuration(0.4, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
            self.view.layoutIfNeeded()
            
        }, completion:  { (finished: Bool) -> Void in
            let title = self.isHidden ? "Show StatusBar" : "Hide StatusBar"
            self.toggleButton.setTitle(title, forState: UIControlState.Normal)
        })
    }
}

