//
//  MovieListViewController.swift
//  SwiftOpenAPI
//
//  Created by Coupang on 2017. 5. 18..
//  Copyright © 2017년 Coupang. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MovieListViewController : UICollectionViewController {
    
    var dataProvider : MovieDataProvider?
    
    override func viewDidLoad() {
        //requestMovieAPI()
    
        dataProvider = MovieDataProvider()
        
        dataProvider?.fetchData(date: NSDate())
        
        for movie in (dataProvider?.movies)! {
            print(movie.title!)
        }
    
    }
    
    /*
    func requestMovieAPI() {
        let url : String = "https://openapi.naver.com/v1/search/movie.json?query=%EC%A3%BC%EC%8B%9D"
        
        let apiURL : URL! = URL(string: url)
        var request = URLRequest(url: apiURL!)
        
        let clientIdField : String = "X-Naver-Client-Id"
        let clientId : String! = "CwcboRWtcxIzxYFKSxxu"
        let clientSecretField : String = "X-Naver-Client-Secret"
        let clientSecret : String! = "tvsQsytA6p"
        
        request.setValue(clientId, forHTTPHeaderField: clientIdField)
        request.setValue(clientSecret, forHTTPHeaderField: clientSecretField)
        
        Alamofire.request(request).responseJSON { response in
            
            switch(response.result) {
            case .success(_):
                
                
                break
                
            case .failure(_):
                print(response.result.error as Any)
                break
            }
        }
    }*/
    
    /*//
     
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
     let row = self.list[indexPath.row]
     
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! MovieListCell
     
     cell.title.text = row.title
     cell.openDate.text = row.openDate
     
     return cell
     }
     
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return self.list.count;
     }
     }
*/
    
}
