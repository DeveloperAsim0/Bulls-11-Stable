//
//  ActiveModeViewController.swift
//  
//
//  Created by Mihir Vyas on 16/05/20.
//

import UIKit

class ActiveModeViewController: UIViewController {
    
    @IBOutlet var firstbtn: UIButton!
    @IBOutlet var secondbtn: UIButton!
    @IBOutlet var thirdbtn: UIButton!
    @IBOutlet var fourthbtn: UIButton!
    @IBOutlet var fifthbtn: UIButton!
    @IBOutlet var sixbtn: UIButton!
    @IBOutlet var sevenbtn: UIButton!
    
    @IBOutlet var myfirstview: [UIView]!
    @IBOutlet var mysecondview: [UIView]!
    @IBOutlet var mythirdview: [UIView]!
    @IBOutlet var myfourthview: [UIView]!
    @IBOutlet var myfifthview: [UIView]!
    @IBOutlet var mysixthview: [UIView]!
    
     @IBOutlet weak var firstbutton: UIButton!
     @IBOutlet weak var secondbutton: UIButton!
     @IBOutlet weak var thirdbutton: UIButton!
     @IBOutlet weak var fourthbutton: UIButton!
     @IBOutlet weak var fifthbutton: UIButton!
     @IBOutlet weak var sixthbutton: UIButton!
    
    @IBOutlet weak var roundbtn1: UIImageView!
    @IBOutlet weak var roundbtn2: UIImageView!
    @IBOutlet weak var roundbtn3: UIImageView!
    @IBOutlet weak var roundbtn4: UIImageView!
    @IBOutlet weak var roundbtn5: UIImageView!
    @IBOutlet weak var roundbtn6: UIImageView!
    
    fileprivate func roundbtn() {
        roundbtn1.layer.cornerRadius = roundbtn1.frame.size.width/2
        roundbtn1.clipsToBounds = true
        
        roundbtn2.layer.cornerRadius = roundbtn2.frame.size.width/2
        roundbtn2.clipsToBounds = true
        
        roundbtn3.layer.cornerRadius = roundbtn3.frame.size.width/2
        roundbtn3.clipsToBounds = true
        
        roundbtn4.layer.cornerRadius = roundbtn4.frame.size.width/2
        roundbtn4.clipsToBounds = true
        
        roundbtn5.layer.cornerRadius = roundbtn5.frame.size.width/2
        roundbtn5.clipsToBounds = true
        
        roundbtn6.layer.cornerRadius = roundbtn6.frame.size.width/2
        roundbtn6.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           roundbtn()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Batting(_ sender: UIButton) {
        myfirstview.forEach { (label) in
                   UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                       label.isHidden = !label.isHidden
                       if label.isHidden {
                           self.firstbutton.setTitleColor(UIColor.black, for: .normal)
                           self.firstbutton.imageView?.tintColor = .black
                       } else {
                           self.firstbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                           self.firstbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                       }
                   self.view.layoutIfNeeded()
                   })
               }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func Bowling(_ sender: UIButton) {
        mysecondview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.secondbutton.setTitleColor(UIColor.black, for: .normal)
                    self.secondbutton.imageView?.tintColor = .black
                } else {
                    self.secondbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.secondbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func Fielding(_ sender: UIButton) {
        mythirdview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.thirdbutton.setTitleColor(UIColor.black, for: .normal)
                    self.thirdbutton.imageView?.tintColor = .black
                } else {
                    self.thirdbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.thirdbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func Others(_ sender: UIButton) {
        myfourthview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.fourthbutton.setTitleColor(UIColor.black, for: .normal)
                    self.fourthbutton.imageView?.tintColor = .black
                } else {
                    self.fourthbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.fourthbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func EconomyRate(_ sender: UIButton) {
        myfifthview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.fifthbutton.setTitleColor(UIColor.black, for: .normal)
                    self.fifthbutton.imageView?.tintColor = .black
                } else {
                    self.fifthbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.fifthbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func StrikeRate(_ sender: UIButton) {
        mysixthview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.sixthbutton.setTitleColor(UIColor.black, for: .normal)
                    self.sixthbutton.imageView?.tintColor = .black
                } else {
                    self.sixthbutton.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.sixthbutton.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
