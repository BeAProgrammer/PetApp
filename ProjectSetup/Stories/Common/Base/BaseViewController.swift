//
//  BaseViewController.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 3/18/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var selectedController = UIViewController()
    
    var baseViewModel: BaseViewModel = BaseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        commonSetup()
    }
    
    func commonSetup() {
        self.view.backgroundColor = UIColor.Theme.text1
    }
    
    func changeRootViewController(with viewController: UIViewController) {
        
        AppDelegate.delegate?.window?.rootViewController = viewController
        (UIApplication.shared.delegate as? AppDelegate)?.window?.makeKeyAndVisible()
    }
    
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func showAlert(title: String?, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //alert.addAction(UIAlertAction(title: LocalizedStringConstant.okString, style: .default, handler: { _ in
            
       // }))
        AppDelegate.delegate?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
