//
//  APICaller.swift
//  NewsApp
//
//  Created by Eslam Ali  on 18/02/2022.
//

import Foundation
public class APICaller {
    
    static let sheard = APICaller()
  
    struct Constants {
        
    static let mainURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apikey=8f55ac14583d442db89ff49a92cd491f")
    }
    
    
    private init(){}
    
    public func getTopStories (completion : @escaping (Result <[String], Error>)-> Void){
        guard let url = Constants.mainURL else {
            // faild to reatch URL
            return
        }
   // success to get the URL
        let task  =  URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data =  data  {

                do {
           let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Count = \(result.articles.count)")
                } catch{
                    completion(.failure(error))
                }


            }
            
        }
        task.resume()
    }
    
    // Models
    
    struct APIResponse : Codable {
        let articles : [Articles]
    }
    
    struct Articles : Codable {
        let title : String
        let description : String?
        let url : String?
        let urlToImage : String?
    }
    
    
    
    
    
    
    
    
    
    
    
    
   
    
}
