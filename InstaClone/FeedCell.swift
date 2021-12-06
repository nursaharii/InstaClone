//
//  FeedCell.swift
//  InstaClone
//
//  Created by Nurşah on 6.12.2021.
//

import UIKit

class FeedCell: UITableViewCell {
    
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeBtn(_ sender: Any) {
    }
}
