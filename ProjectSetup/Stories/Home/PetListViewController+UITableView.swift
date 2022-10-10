//
//  PetListViewController+UITableView.swift
//  ProjectSetup
//
//  Created by Shreyas on 09/10/22.
//  Copyright © 2022 Shreyas. All rights reserved.
//

import UIKit

extension PetListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petListModel?.pets.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeReusableCell(PetListTableViewCell.self) else {return UITableViewCell()}
        cell.petDetails = petListModel?.pets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTutorial(index: indexPath.row)
    }
}
