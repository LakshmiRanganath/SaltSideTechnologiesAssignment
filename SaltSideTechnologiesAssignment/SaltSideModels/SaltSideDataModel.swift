//
//  SaltSideDataModel.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//


import Foundation

struct SaltSideDataModel : Codable{
    var image : String?
    var description : String?
    var title : String?
    
    init(){
        
    }
    
    init(image : String, description : String, title : String) {
        self.image = image
        self.description = description
        self.title = title
    }
}
