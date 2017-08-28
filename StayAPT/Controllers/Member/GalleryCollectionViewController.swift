//
//  GalleryCollectionViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GalleryCollectionViewController: BaseCollectionViewController {
    
    let memberArray = [ SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
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
    
     weak var pvc: MenuViewController?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memberArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GalleryCollectionViewCell
    
        cell.member = memberArray[indexPath.item]
        return cell
    }
}

extension GalleryCollectionViewController: UICollectionViewDelegateFlowLayout {
 fileprivate var sectionInsets: UIEdgeInsets {
 return .init(top: 8, left: 8, bottom: 8, right: 8)
 
 }
 
 fileprivate var itemsPerRow: CGFloat {
 return 2
 
 }
 
 fileprivate var interitemSpace: CGFloat {
 return 0.0
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 sizeForItemAt indexPath: IndexPath) -> CGSize {
 let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
 let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
 let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
 let widthPerItem = availableWidth / itemsPerRow
 
 return CGSize(width: widthPerItem, height: widthPerItem)
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 insetForSectionAt section: Int) -> UIEdgeInsets {
 return sectionInsets
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return 5.0
 }
 }
