//
//  BaseViewModel.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 3/18/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func uploadStatus(_ status: Bool)
}

class BaseViewModel: NSObject {
    
    var apiSuccess: (() -> Void)?
    
    var apiFaliure: ((ErrorResponse) -> Void)?
    
    var apiFail: (() -> Void)?
}
