//
//  SaltSideDetailView.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import Foundation
import UIKit

class SaltsideDetailViewController : UIViewController{
    
    
    //MARK: - Properties
    @IBOutlet weak var saltsideImageView: CacheImageView!
    
    @IBOutlet weak var saltsideTitleLabel: UILabel!
    
    @IBOutlet weak var saltsideDescriptionLabel: UILabel!
    
    var saltsideDetailViewModel = SaltsideDetailViewModel()

    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Details"
        setAccessibilityIdentifiers()
        populateDetailView()
    }
    
    //MARK: - Set accessibilty Identifiers for UITest
    func setAccessibilityIdentifiers(){
        saltsideImageView.accessibilityIdentifier = "image--saltsideImageView"
        saltsideTitleLabel.accessibilityIdentifier = "label--saltsideTitleLabel"
        saltsideDescriptionLabel.accessibilityIdentifier = "label--saltsideDescriptionLabel"
    }
    
    
    //MARK: - Populate detail view
    func populateDetailView(){
        let imageUrlString = saltsideDetailViewModel.detailModel.image
        if imageUrlString != "" || imageUrlString != nil{
            saltsideImageView.loadImageViewWithUrlString(urlString: imageUrlString!)
        }
        else{
            saltsideImageView.image = UIImage(systemName: "nosign")
        }
        saltsideTitleLabel.text = saltsideDetailViewModel.detailModel.title?.uppercased()
        
        saltsideDescriptionLabel.text = saltsideDetailViewModel.detailModel.description
    }
}
