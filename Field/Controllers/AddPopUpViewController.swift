//
//  AddPopUpViewController.swift
//  Field
//
//  Created by amyz on 5/13/21.
//

import UIKit

class AddPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.black.withAlphaComponent(0.5)
    }
    
    func showAnimate(){
        
        
    }

    @IBAction func closePopUp(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    

}