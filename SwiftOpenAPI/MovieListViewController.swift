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
        
        dataProvider?.fetchData(date: NSDate())
        
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
     //  MovieListViewController.swift
     //  SimpleMovie
     //
     //  Created by Coupang on 2017. 5. 16..
     //  Copyright © 2017년 Coupang. All rights reserved.
     //
     
     import UIKit
     import Foundation
     
     class MovieListViewController : UICollectionViewController {
     
     lazy var list : [MovieValueObject] = {
     var dataList = [MovieValueObject]()
     return dataList
     }()
     
     var currentDate : String?
     override func viewDidLoad() {
     let nowDate = NSDate()
     let formatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd"
     var DateString = formatter.string(from: nowDate as Date)
     DateString = DateString.replacingOccurrences(of: "-", with: "")
     
     currentDate = DateString
     
     requestMovieAPI()
     }
     
     func requestMovieAPI() {
     
     //!처리 어떻게 해야될지
     let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=bd635d7ac0851ee9087d9c472912c1e8&targetDt=\(self.currentDate!)"
     
     let apiURL : URL! = URL(string: url)
     let apiData = try! Data(contentsOf: apiURL)
     //print(NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? "")
     //let decodingData = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue)?.data
     do {
     
     let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
     let movieListResult = apiDictionary["movieListResult"] as! NSDictionary
     let movieList = movieListResult["movieList"] as! NSArray
     
     for movie in movieList {
     let thisMovie = movie as! NSDictionary
     
     let movieVO = MovieValueObject()
     movieVO.title = thisMovie["movieNm"] as? String
     movieVO.openDate = thisMovie["openDt"] as? String
     
     self.list.append(movieVO)
     }
     
     } catch {
     
     }
     
     }
     
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
