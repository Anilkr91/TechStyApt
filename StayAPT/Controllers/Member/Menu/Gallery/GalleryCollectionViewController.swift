//
//  GalleryCollectionViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GalleryCollectionViewController: BaseCollectionViewController {
    
    let memberArray = [ SACheckedInMember(image: "http://crossislandfitness.com/wp-content/uploads/2016/01/s41.jpg", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "http://highlinefitness.in/img/gallery/new1.jpg", name: "John", counter: "20/20"),
                        SACheckedInMember(image: "http://highlinefitness.in/img/gallery/img-gal-54.jpg", name: "Rohit", counter: "20/20"),
                        SACheckedInMember(image: "http://www.generalgraphics.com/images/Installation_Keoki_2.jpg", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "http://leobrowngroup.com/wp-content/uploads/2017/02/fitness-center-gallery-768x510.jpg", name: "Rohan", counter: "20/20"),
                        SACheckedInMember(image: "https://s-media-cache-ak0.pinimg.com/736x/08/7e/ca/087eca9383cd2d638cda904ed35c4035.jpg", name: "Prakash", counter: "20/20"),
                        SACheckedInMember(image: "http://1jncer125gfi1y0shjjd6uib.wpengine.netdna-cdn.com/wp-content/uploads/2015/06/equinox_06.jpg", name: "Ankur", counter: "20/20"),
                        SACheckedInMember(image: "http://ygh.com/wp-content/uploads/01-TCO-Sports-Center-option-1.jpg", name: "Bhagat", counter: "20/20"),
                        SACheckedInMember(image: "http://1jncer125gfi1y0shjjd6uib.wpengine.netdna-cdn.com/wp-content/uploads/2015/06/equinox_06.jpg", name: "Ram Rahim", counter: "20/20"),
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
        return .init(top: 8 , left: 8, bottom: 8, right: 8)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 2
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem-30)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
