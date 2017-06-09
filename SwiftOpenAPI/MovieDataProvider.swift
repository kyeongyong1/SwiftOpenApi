//
//  MovieDataProvider.swift
//  SwiftOpenAPI
//
//  Created by Coupang on 2017. 6. 7..
//  Copyright © 2017년 Coupang. All rights reserved.
//

import Foundation

class MovieDataProvider {
    
    var movies : [Movie]?
    
    func fetchData(date: NSDate) {
        
        movies = [Movie]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var DateString = formatter.string(from: date as Date)
        DateString = DateString.replacingOccurrences(of: "-", with: "")
        
        //!처리 어떻게 해야될지
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=bd635d7ac0851ee9087d9c472912c1e8&targetDt=\(DateString)"
        
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
                
                let movieVO = Movie()
                movieVO.title = thisMovie["movieNm"] as? String
                movieVO.openDate = thisMovie["openDt"] as? String
                
                self.movies?.append(movieVO)
            }
            
        } catch {
            
        }
    }
    
}
