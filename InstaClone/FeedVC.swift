//
//  FeedVC.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit
import Firebase
import SDWebImage

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userLbl.text = user[indexPath.row]
        cell.counter.text = String(counter[indexPath.row])
        cell.comment.text = comment[indexPath.row]
        cell.img.sd_setImage(with: URL(string: img[indexPath.row]))
        cell.docId = docArry[indexPath.row]
        return cell
    }
    var user = [String]()
    var counter = [Int]()
    var comment = [String]()
    var img = [String]()
    var date = [Date]()
    var docArry = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFireStore()
        // Do any additional setup after loading the view.
    }
    
    func getDataFromFireStore(){
        let firestoreDb = Firestore.firestore()
        firestoreDb.collection("Posts").order(by: "date",descending: true).addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription)
            }
            else{
                if snapshot?.isEmpty != nil {
                    for doc in snapshot!.documents  {
                        let documentID = doc.documentID
                        self.docArry.append(documentID)
                        if let postedBy =  doc.get("postedBy") as? String {
                            self.user.append(postedBy)
                        }
                        if let imgUrl =  doc.get("imgUrl") as? String {
                            self.img.append(imgUrl)
                        }
                        if let likes =  doc.get("likes") as? Int {
                            self.counter.append(likes)
                        }
                        if let postComment =  doc.get("postComment") as? String {
                            self.comment.append(postComment)
                        }
                        if let dates =  doc.get("date") as? Date {
                            self.date.append(dates)
                        }
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }

}
