//
//  PetListTableViewCell.swift
//  ProjectSetup
//
//  Created by Shreyas on 09/10/22.
//  Copyright © 2022 Shreyas. All rights reserved.
//

import UIKit
import SDWebImage
class PetListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petNameLabel: UILabel!
    
    @IBOutlet weak var petImageView: UIImageView!
    
    var petDetails: Pet? {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupUI() {
        petNameLabel.configure(text: petDetails?.title ?? "", color: UIColor.Theme.text2, font: UIFont.Theme.interRegular15)
        petImageView.sd_setImage(with: URL(string: petDetails?.imageURL ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
    }
}
