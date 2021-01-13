//
//  SaltsideListViewModel.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import Foundation

class SaltsideListViewModel : NSObject{
    var SaltsideList = [SaltSideDataModel]()
    
    
    func fetchSaltSideList(completion : @escaping(Result<[SaltSideDataModel], Error>) -> ()){
        URLSession.shared.dataTask(with: URL(string : SaltsideConstants.saltsideListUrlString )!){(data, response, error) in
            if (error != nil){
                completion(.failure(error!))
            }
            else{
            if (data != nil){
                    do{
                        let saltsideListResponse = try JSONDecoder.init().decode([SaltSideDataModel].self, from: data!)
                        completion(.success(saltsideListResponse))
                    }catch let jsonError{
                        completion(.failure(jsonError))
                    }
                    
                }
                
            }
        }.resume()
    }
    
}
