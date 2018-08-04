//
//  BusinessCell.swift
//  Yelp
//
//  Created by AUNG PHYO on 8/3/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var smallPhotoView: UIImageView!
    
    @IBOutlet weak var ratingImage: UIImageView!
    
    @IBOutlet weak var businessTitle: UILabel!
    
    @IBOutlet weak var numberOfReview: UILabel!
    
    @IBOutlet weak var mileLabel: UILabel!
    
    @IBOutlet weak var dollerSign: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var typeOfFood: UILabel!
    
    var business: Business!{
        didSet{
            businessTitle.text = business.name
            smallPhotoView.setImageWith(business.imageURL!)
            typeOfFood.text = business.categories
            addressLabel.text = business.address
            numberOfReview.text = "\(business.reviewCount!) Reviews"
            mileLabel.text = business.distance
            ratingImage.image = business.ratingImage
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
