//
//  PetListViewController+UI.swift
//  ProjectSetup
//
//  Created by Shreyas on 05/03/21.
//  Copyright © 2021 Shreyas. All rights reserved.
//

import UIKit

extension PetListViewController {
    
    func setupUI() {
        self.setupNavigationBar()
        self.setupLabels()
        self.setupTableView()
        self.setupViews()
        self.setupData()
    }
    
    func setupData() {
        viewModel.getConfigData()
    }
    
    func setupNavigationBar() {
        self.title = LocalizedStringConstant.pets
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLabels() {
        
    }
    
    func setupTableView() {
        tableView.register(PetListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = 0.0
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.reloadData()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.Theme.text3
    }
}
