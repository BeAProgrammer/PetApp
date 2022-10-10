//
//  LoginStoryboard.swift
//  ProjectSetup
//
//  Created by Shreyas on 05/03/21.
//  Copyright © 2021 Shreyas. All rights reserved.
//

import UIKit

enum LoginStoryboard: StoryboardRouter {
    
    case initial
    case signIn
    
    var name: String {
        return "Login"
    }
    
    var controller: UIViewController {
        
        switch self {
        case .initial: return self.getInitialViewController()!
        case .signIn: return self.getViewController(T: PetListViewController.self)!
        }
    }
}
