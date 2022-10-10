//
//  PetListViewModel.swift
//  ProjectSetup
//
//  Created by Shreyas on 05/03/21.
//  Copyright © 2021 Shreyas. All rights reserved.
//

import Foundation

protocol PetListViewModelDelegate: AnyObject {
    func viewModelDidUpdate(_ viewModel: PetListViewModel)
}

class PetListViewModel: BaseViewModel {
    
    weak var delegate: PetListViewModelDelegate?
    
    var selectedRow: Int?
    
    var petListModel: PetList?
    var configModel: Config?

    var isValidTime: Bool = false
        
    override init() {
        
    }
    
    func getPetData() {
        if let path = Bundle.main.path(forResource: "pets_list", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                do {
                    let petList = try decoder.decode(PetList.self, from: data)
                    self.petListModel = petList
                    delegate?.viewModelDidUpdate(self)
                } catch {
                    print(error.localizedDescription)
                }
              } catch {
                   // handle error
              }
        }
    }
    
    func getConfigData() {
        if let path = Bundle.main.path(forResource: "config", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                do {
                    let config = try decoder.decode(Config.self, from: data)
                    self.configModel = config
                    delegate?.viewModelDidUpdate(self)
                } catch {
                    print(error.localizedDescription)
                }
              } catch {
                   // handle error
              }
        }
    }
}
