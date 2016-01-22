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
        
        self.edgesForExtendedLayout = [.Bottom, .Left, .Right]
        
        self.view.backgroundColor = UIColor(red: 0, green: 100/255.0, blue: 200/255.0, alpha: 1.0)
        self.textView.backgroundColor = UIColor.greenColor()
        
        self.toggleButton.tintColor = UIColor.whiteColor()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
            //self.view.layoutIfNeeded()
            
        }, completion:  { (finished: Bool) -> Void in
            let title = self.isHidden ? "Show StatusBar" : "Hide StatusBar"
            self.toggleButton.setTitle(title, forState: UIControlState.Normal)
        })
    }
}

