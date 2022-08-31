//
//  FBLoginVC.swift
//  Foodbes
//
//  Created by Admin on 27/08/22.
//

import UIKit

class FBLoginVC: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var loginSegmentView : UIView!
    @IBOutlet weak var signUpSegmentView : UIView!
    @IBOutlet weak var passwordTextField : UITextField!
    var password : String = "" {
        didSet {
            print("password : \(password)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        shadowView.layer.applySketchShadow(color: .black, alpha: 0.06, x: 0, y: 4, blur: 30, spread: 0)
        shadowView.layer.cornerRadius = 30
        self.signUpSegmentView.isHidden = true
        passwordTextField.delegate = self
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let gotoTabBar = storyboard?.instantiateViewController(withIdentifier: "tab") else {return}
        self.navigationController?.pushViewController(gotoTabBar, animated: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        loginSegmentView.isHidden = false
        self.signUpSegmentView.isHidden = true
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        self.signUpSegmentView.isHidden = false
        self.loginSegmentView.isHidden = true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
         {
             if string == ""{
                 
             }else {
             password = password+string
             textField.text = textField.text!+"* "
             }
              return false
         }
    

}

extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0) {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
