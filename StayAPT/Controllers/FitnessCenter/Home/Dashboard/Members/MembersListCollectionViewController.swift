//
//  MembersListCollectionViewController.swift
//  StayAPT
//
//  Created by admin on 07/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MembersListCollectionViewController: BaseCollectionViewController, UISearchResultsUpdating {
    
    var memberArray = [ SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
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
    
    var filteredArray = [SACheckedInMember]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredArray = memberArray
        setupSearchController()
    }
    
    func setupSearchController() {
        
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for tools and resources"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        self.navigationItem.titleView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredArray = memberArray
        } else {
            // Filter the results
            filteredArray = memberArray.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
            print(filteredArray)
        }
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return filteredArray.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MembersListCollectionViewCell
        cell.member = filteredArray[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showMembersDetailsSegue", sender: self)
    }
}

extension MembersListCollectionViewController: UICollectionViewDelegateFlowLayout {
    fileprivate var sectionInsets: UIEdgeInsets {
        return .init(top: 8, left: 8, bottom: 8, right: 8)
        
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 4
        
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
        
        return CGSize(width: widthPerItem, height: widthPerItem+20)
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
