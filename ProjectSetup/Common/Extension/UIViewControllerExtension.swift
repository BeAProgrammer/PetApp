//
//  UIViewControllerExtension.swift

// swiftlint:disable identifier_name

import Foundation
import UIKit

public extension UIViewController {
    
    @objc class var identifier: String {
        return String(describing: self)
    }
    
    func pushToRootViewController(T: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushToRootViewController(T: T)
        }
    }
    
    func pushViewController(T: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(T, animated: true)
        }
    }
    
    func pushViewControllerWithoutAnimation(T: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(T, animated: false)
        }
    }
    
    func presentViewController(T: UIViewController) {
        DispatchQueue.main.async {
            T.modalPresentationStyle = .fullScreen
            self.present(T, animated: true, completion: nil)
        }
    }
    
    func presentViewController(T: UIViewController, style: UIModalPresentationStyle = .formSheet) {
        DispatchQueue.main.async {
            T.modalPresentationStyle = style
            self.present(T, animated: true, completion: nil)
        }
    }
    
    func dismissViewController(T: UIViewController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func popViewController() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func popViewControllerWithoutAnimation() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: false)
            
        }
    }
    
    func popViewController(T: Any) {
        DispatchQueue.main.async {
            guard let controllers = self.navigationController?.viewControllers else { return }
            for view in controllers {
                if "\(type(of: view)).Type" == "\(type(of: T))" {
                    
                    self.navigationController?.popToViewController(view, animated: true)
                    
                    break
                }
            }
        }
    }
    
    func popToRootViewController() {
        DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
            
        }
    }
    
    func controller<T>(_ type: T.Type) -> T? {
        return NSClassFromString(String(describing: type)) as? T
    }
    
    func addViewAtNonSafeAreaBottom(color: UIColor) {
        
        if UIDevice.current.hasNotch {
            let bottomSafeAreaView = UIView()
            view.addSubview(bottomSafeAreaView)
            bottomSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
            bottomSafeAreaView.backgroundColor = color
            
            NSLayoutConstraint.activate([
                bottomSafeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                bottomSafeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                bottomSafeAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                bottomSafeAreaView.heightAnchor.constraint(equalToConstant: 32)
            ])
            
        }
    }
}
