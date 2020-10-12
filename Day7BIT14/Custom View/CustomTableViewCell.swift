//
//  CustomTableViewCell.swift
//  Day7BIT14
//
//  Created by Jlius Suweno on 07/10/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var clubImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCustomCell(image: String, item: String, detail: String){
        clubImageView.image = UIImage(named: image)
        itemLabel.text = item
        detailsLabel.text = detail
    }
    
}
