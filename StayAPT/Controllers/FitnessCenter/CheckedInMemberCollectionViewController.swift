//
//  CheckedInMemberCollectionViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class CheckedInMemberCollectionViewController: UICollectionViewController {
    
    let memberArray = [
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memberArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CheckedInMemberCollectionViewCell
        
        cell.imageView.image = UIImage(imageLiteralResourceName: memberArray[indexPath.item].image)
        cell.saNameLabel.text = memberArray[indexPath.item].name
        cell.saCountLabel.text = memberArray[indexPath.item].counter
        return cell
    }

}
