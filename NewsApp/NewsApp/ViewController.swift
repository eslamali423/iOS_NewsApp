//
//  ViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 18/02/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
     
    var viewModel = [NewsTabelViewCellModel]()
    var articles = [APICaller.Articles]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "News"
        view.backgroundColor = .systemBackground
        
        APICaller.sheard.getTopStories { (result) in
            switch result {
            case .success(let articles):
                self.articles = articles
                self.viewModel = articles.compactMap({ NewsTabelViewCellModel(title: $0.title, subTitle: $0.description ?? "no discription", imageUrl: URL(string : $0.urlToImage ?? ""))
                
                })
                print("success")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error) :
                print("error")
            }
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsID", for: indexPath) as! NewsTableViewCell
        cell.confgureNewsCell(with: viewModel[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = self.articles[indexPath.row]
        
        guard  let url = URL(string: article.url ?? "") else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        

        

    }
    
    
        
    


}

