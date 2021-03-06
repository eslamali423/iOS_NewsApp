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
    static let searchURL = "https://newsapi.org/v2/everything?sortedBy=popularity&apikey=8f55ac14583d442db89ff49a92cd491f&q="
     

    }
    
    
    private init(){}
    
     func getTopStories (completion : @escaping (Result <[Articles], Error>)-> Void){
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
                    completion(.success(result.articles))
                } catch{
                    completion(.failure(error))
                }


            }
            
        }
        task.resume()
    }
    
    func search (with query :  String, completion : @escaping (Result <[Articles], Error>)-> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
         let urlString = Constants.searchURL + query
        guard let url = URL (string: urlString) else {
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
                   completion(.success(result.articles))
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
    
   public struct Articles : Codable {
        let title : String
        let description : String?
        let url : String?
        let urlToImage : String?
    }
    
    
    
    
    
    
    
    
    
    
    
    
   
    
}
