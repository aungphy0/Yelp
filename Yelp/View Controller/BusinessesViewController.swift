//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by AUNG PHYO on 8/3/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
   
    
    
 
    var businesses: [Business]!
    var searchController: UISearchController!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 120
    
        //tableView.rowHeight = 120
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm(term: "Restaurants", sort: .distance, categories: ["asianfusion", "burgers"]) { (businesses, error) in
         self.businesses = businesses
         for business in self.businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
        
         searchBar.sizeToFit()
        
         navigationItem.titleView = searchBar
        
         searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        
        searchController.hidesNavigationBarDuringPresentation = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil{
            return businesses.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
