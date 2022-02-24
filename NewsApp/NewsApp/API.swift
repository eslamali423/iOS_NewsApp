//
//  API.swift
//  NewsApp
//
//  Created by Eslam Ali  on 24/02/2022.
//

import Foundation

import Alamofire

class  API {
   static let shared = API()
    
    struct Constants {
        
    static let mainURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apikey=8f55ac14583d442db89ff49a92cd491f")
    static let searchURL = "https://newsapi.org/v2/everything?sortedBy=popularity&apikey=8f55ac14583d442db89ff49a92cd491f&q="
     

    }
    
    private init(){}

    func getData()  {
        guard let url =  Constants.mainURL else { return }
     
        }
        
        
    }
    
    
    

