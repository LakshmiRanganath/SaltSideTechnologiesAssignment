//
//  ViewController.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var saltsideTableView: UITableView!
    
    @IBOutlet weak var errorDisplayLabel: UILabel!
    
    @IBOutlet weak var tryAgainButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var saltSideListViewModel = SaltsideListViewModel()
    
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIdentifiers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "SaltSide Technologies"
        if saltSideListViewModel.saltsideList.count == 0{
            callSaltsideDataList()
        }
    }
    
    //MARK: - AccessibiltyIdentifiers
    func setAccessibilityIdentifiers(){
        saltsideTableView.accessibilityIdentifier = "table--saltsideTableView"
        errorDisplayLabel.accessibilityIdentifier = "label--errorDisplayLabel"
        tryAgainButton.accessibilityIdentifier = "button--tryAgainButton"
        activityIndicator.accessibilityIdentifier = "activityIndicator--activityIndicator"
        
    }
    
    //MARK: - Function to fetch data list
    func callSaltsideDataList(){
        saltSideListViewModel.fetchSaltSideList(completion:{ resultFetched in
            switch(resultFetched){
            case .failure(let error) :
                //Display an alert to show error
                DispatchQueue.main.async {[weak self] in
                    let alert = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: {(action) in
                        self?.okActionToPerform(error: error)
                    })
                //Try again action is added to alert and callFetch is called again.
                    let tryAgainAction = UIAlertAction(title: "Try Again", style: .default, handler: { (action) in
                        
                        self?.errorHandlingViews(shouldBeHidden: true)
                        self?.callSaltsideDataList()
                    })
                    
                    alert.addAction(okAction)
                    alert.addAction(tryAgainAction)
                    
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    
                    self?.present(alert, animated: true)
                }
                
            case .success(let arrayFetched) :
                //if data is fetched succefully, collectionView  is reloaded
                self.saltSideListViewModel.saltsideList = arrayFetched
                DispatchQueue.main.async { [weak self] in
                    self?.errorHandlingViews(shouldBeHidden: true)
                    self?.activityIndicator.isHidden = false
                    
                    self?.saltsideTableView.reloadData()
                    
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                }
            }
        })
    }

    //MARK: - Error display and try again display handling
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        callSaltsideDataList()
    }
    
    fileprivate func errorHandlingViews(shouldBeHidden : Bool){
        self.errorDisplayLabel.isHidden = shouldBeHidden
        self.tryAgainButton.isHidden = shouldBeHidden
    }
    
    //MARK: - Actions to perform when user taps on Ok button of error alert.
    fileprivate func okActionToPerform(error : Error) {
        self.errorHandlingViews(shouldBeHidden: false)
        self.errorDisplayLabel.text = error.localizedDescription
        self.view.bringSubviewToFront(self.errorDisplayLabel)
        self.view.bringSubviewToFront(self.tryAgainButton)
    }
    
    
}


//MARK: - Table view datasource methods
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.saltSideListViewModel.saltsideList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SaltsideTableViewCell = tableView.dequeueReusableCell(withIdentifier: "saltsideTableViewCell", for: indexPath) as! SaltsideTableViewCell
        
        let dataAtCellIndex = saltSideListViewModel.saltsideList[indexPath.row]
        
        if dataAtCellIndex.image != "" || dataAtCellIndex.image != nil{
            cell.saltsideImageView.loadImageViewWithUrlString(urlString: dataAtCellIndex.image!)
        }
        else{
            cell.saltsideImageView.image = UIImage(systemName: "nosign")
        }
        if dataAtCellIndex.title != nil{
            cell.saltsideTitleLabel.text = dataAtCellIndex.title
        }
        if dataAtCellIndex.description != nil{
            cell.saltsideDescriptionLabel.text = dataAtCellIndex.description
        }
        
        return cell
    }
    
    
}

//MARK: - Table view delegate methods
extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height/4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}


