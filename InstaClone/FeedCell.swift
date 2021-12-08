//
//  FeedCell.swift
//  InstaClone
//
//  Created by Nurşah on 6.12.2021.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    
    @IBOutlet weak var cell: UIView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var docId = String()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeBtn(_ sender: Any) {
        let fireStoreDatabase = Firestore.firestore()
        
        if var sayac = Int(counter.text!){
            sayac = sayac + 1
        let likeStore = ["likes" : sayac] as [String : Any]
        fireStoreDatabase.collection("Posts").document(docId).setData(likeStore, merge: true)
            counter.text = String(sayac)
        }
        
    }
}
