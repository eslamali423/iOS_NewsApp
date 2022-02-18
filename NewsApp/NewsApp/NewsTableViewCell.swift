//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Eslam Ali  on 18/02/2022.
//

import UIKit

class NewsTabelViewCellModel {
    
    let title :  String
    let subTitle  :  String
    let imageUrl : URL?
    let imageData : Data? =  nil
    
    init(title : String, subTitle :  String, imageUrl : URL?) {
        self.title =  title
        self.subTitle = subTitle
        self.imageUrl = imageUrl
    }
    
     
    
    
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var tittle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func confgureNewsCell (with model : NewsTabelViewCellModel){
        self.tittle.text = model.title
        self.subtitle.text = model.subTitle
        
        if let data = model.imageData {
            self.newsImage.image = UIImage(data: data)
        }else if let url = model.imageUrl{
            // fetch image
        
            URLSession.shared.dataTask(with: url ){  data, _ , error in
                guard let data =  data , error == nil else {
                    return
                }
                DispatchQueue.main.async {
                 //   model.imageData = data
                    self.newsImage.image = UIImage(data: data)
                }
            
            }.resume()
                
            
        
        }
        
        
        
    }
    

}
