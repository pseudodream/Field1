//
//  PostTableViewCell.swift
//  Field
//
//  Created by amyz on 5/13/21.
//

import UIKit
import Firebase
private let dateFormatter: DateFormatter = {
    let dateFormatter=DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter
}()

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var pfpImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var textPosted: UITextView!
    @IBOutlet weak var imagePosted: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hashtagLabel: UILabel!
    
    var post:Post! {
        didSet{
            titleLabel.text=post.title
            if post.hasImage == true{
                textPosted.isHidden=true
                let db=Firestore.firestore()
                var postPhoto=PostPhoto()
                db.collection("posts").document(post.documentID).collection("photos").getDocuments { (querySnapshot, error) in
                    guard error == nil else {
                        print("ERROR: adding the snapshot listener \(error!.localizedDescription)")
                       return
                    }
                    for document in querySnapshot!.documents{
                        postPhoto.documentID=document.documentID//currently only support add one photo per post
                        postPhoto.loadImage(post: self.post){(success) in
                            
                            self.imagePosted.image=postPhoto.image
                            //print("aaaaa",postPhoto.documentID,self.imagePosted.image)
                        }
                    }
                }
                
            }else{
                imagePosted.isHidden=true
                textPosted.text=post.body
            }
            
            hashtagLabel.text=post.hashtag
            dateLabel.text="Posted on: \(dateFormatter.string(from: post.date))"
        }
    }
    
    var user: AppUser! {
        didSet{
            
        }
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
    }
    
   
    
    

}