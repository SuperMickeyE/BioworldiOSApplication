//
//  GloveViewController.swift
//  BioWorld
//
//  Created by McKenna on 4/6/17.
//  Copyright © 2017 UTA Bioworld Team. All rights reserved.
//

import UIKit
// Used for main page swiping mechanic
class GloveViewController: UIViewController {
    
    
    @IBOutlet weak var activeDeviceBtn: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var deviceDetailsView: UIView!
    @IBOutlet weak var pager: UIPageControl!
    
    @IBAction func activateDevice(_ sender: UIButton) {
        self.pages[pageIndex] = true
        updateDeviceUI()
        
        // Cool animation
        let width = self.deviceDetailsView.frame.width
        let height = self.deviceDetailsView.frame.height
        
        self.deviceDetailsView.frame = CGRect(x: 0, y: self.view.frame.height, width: width, height: height)
        UIView.animate(withDuration: 0.3) {
            let width = self.deviceDetailsView.frame.width
            let height = self.deviceDetailsView.frame.height
            self.deviceDetailsView.frame = CGRect(x: 0, y: self.view.frame.height - height, width: width, height: height)
        }
    }
    
    // BOolean is isActive or connected
    var pages = [
        false, true, false
    ]
    
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        
        updateDeviceUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipe(gesture: UISwipeGestureRecognizer) {
        switch(gesture.direction) {
        case UISwipeGestureRecognizerDirection.left:
            changePage(page: pageIndex + 1)
            break
            
        case UISwipeGestureRecognizerDirection.right:
            changePage(page: pageIndex - 1)
            break
            
        default:
            break
            
        }
    }
    
    func changePage(page: Int) {
        if page > pages.count || page < 0 {
            return
        }
        
        self.pageIndex = page
        self.pager.currentPage = pageIndex
        self.updateDeviceUI()
    }
    
    func updateDeviceUI() {
        //var count = 0
        let active = self.pages[pageIndex]
//        for i in 0...2 {
 //           if i != pageIndex && count == 0{
  //              let inactive1 = self.pages[i]
   //             count = count + 1
    //        }
     //       else if i != pageIndex && count == 1{
      //          let inactive2 = self.pages[i]
        //    }
        //}
        
        activeDeviceBtn.isHidden = active
        deviceDetailsView.isHidden = !active
        
        if active {
            
        }

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
