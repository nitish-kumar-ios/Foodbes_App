//
//  ViewController.swift
//  Foodbes
//
//  Created by Admin on 27/08/22.
//

import UIKit

class TutorialVC: UIViewController {
    
    @IBOutlet weak var blurViewFirst: UIView!
    @IBOutlet weak var blurViewSecond: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = blurViewFirst.bounds
        gradientLayer.colors = [#colorLiteral(red: 1, green: 0.2784313725, blue: 0.0431372549, alpha: 0.1).cgColor,#colorLiteral(red: 1, green: 0.2784313725, blue: 0.0431372549, alpha: 1).cgColor]
        self.blurViewFirst.layer.insertSublayer(gradientLayer, at: 0)
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = blurViewSecond.bounds
        gradientLayer2.colors = [#colorLiteral(red: 1, green: 0.2784313725, blue: 0.0431372549, alpha: 0.51).cgColor,#colorLiteral(red: 1, green: 0.2784313725, blue: 0.0431372549, alpha: 1).cgColor]
        self.blurViewSecond.layer.insertSublayer(gradientLayer2, at: 0)
        
    }
    
    @IBAction func getStarteedBtn(_ sender: UIButton) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "FBLoginVC") else { return  }
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    
}

