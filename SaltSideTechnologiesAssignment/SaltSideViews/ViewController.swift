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
    
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIdentifiers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "SaltSide Technologies"
    }
    
    //MARK: - AccessibiltyIdentifiers
    func setAccessibilityIdentifiers(){
        saltsideTableView.accessibilityIdentifier = "table--saltsideTableView"
        errorDisplayLabel.accessibilityIdentifier = "label--errorDisplayLabel"
        tryAgainButton.accessibilityIdentifier = "button--tryAgainButton"
        activityIndicator.accessibilityIdentifier = "activityIndicator--activityIndicator"
        
    }

    //MARK: - Error display and try again display handling
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        
        
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SaltsideTableViewCell = tableView.dequeueReusableCell(withIdentifier: "saltsideTableViewCell", for: indexPath) as! SaltsideTableViewCell
        
        return cell
    }
    
    
}

//MARK: - Table view delegate methods
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}


