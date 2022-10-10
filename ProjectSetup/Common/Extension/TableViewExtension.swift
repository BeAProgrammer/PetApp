//
//  TableViewExtension.swift
//  ProjectSetup
//
//  Created by Shreyas on 01/05/21.
//  Copyright © 2021 Shreyas. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let className =  String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func dequeReusableCell<T>(_ type: T.Type) -> T? {
        let className =  String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}

public extension UITableViewCell {
    
    @objc class override var identifier: String {
        return String(describing: self)
    }
}
