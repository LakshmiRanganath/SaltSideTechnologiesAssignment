//
//  SaltsideImageExtension.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import Foundation
import UIKit

//LRU cache with capacity 5 is initialised
let imageCache = SaltsideLRUCache<String, Any>(SaltsideConstants.saltsideLRUMaxCacheSize)

class CacheImageView : UIImageView{
    //This is used  to cross check with urlstring before loading into imageview, to avoid mismatch of images on scroll etc...
    var imageUrlString  = String()
    
    func loadImageViewWithUrlString(urlString : String){
        imageUrlString = urlString
        let url = URL(string: urlString)
        image = nil
        
        //Check if the image with urlstring is present in cache, if present fetch from cache else, fetch image from urlString and save in lrucache
        if imageCache.isValid(key: urlString){
            self.image = imageCache.get(urlString) as? UIImage
            return
        }
        
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "Error occured while fetching image from url")
                return
            }
            if data == nil{
                print("No data found")
                return
            }
            guard let imageToCache = UIImage(data: data!) else{
                print("Error occured while fetchimng image from url \(urlString)")
                return
            }
            imageCache.put(urlString, imageToCache)
        
            DispatchQueue.main.async {[weak self] in
                if self?.imageUrlString == urlString{
                    self?.image = imageToCache
                }
            }
        }.resume()
        
        
    }
}
