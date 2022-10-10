//
//  PetListViewController.swift
//  ProjectSetup
//
//  Created by Shreyas on 05/03/21.
//  Copyright © 2021 Shreyas. All rights reserved.
//

import UIKit
import SafariServices

class PetListViewController: BaseViewController {
    
    var viewModel: PetListViewModel! = PetListViewModel()
    
    var petListModel: PetList?
    
    var configModel: Config?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self

        setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func showTutorial(index: Int) {
        if let url = URL(string: petListModel?.pets[index].contentURL ?? "") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    
    func validate() {
        if GlobalHelper().validateTime(timeString: viewModel.configModel?.settings.workHours ?? "") {
            viewModel.getPetData()
        } else {
            self.showAlert(title: LocalizedStringConstant.appName, message: LocalizedStringConstant.errorTimeDuration)
        }
    }
    
}

extension PetListViewController: PetListViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: PetListViewModel) {
        self.viewModel = viewModel
        self.petListModel = viewModel.petListModel
        self.validate()
        self.tableView.reloadData()
    }
}
