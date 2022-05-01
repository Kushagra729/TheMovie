//
//  MovieModel.swift
//  TheMovie
//
//  Created by Osvin-Mob-MAc on 30/04/22.
//

import Foundation
import ObjectMapper
import Alamofire

//MARK: - Global Constant
let imageBaseURL = "https://image.tmdb.org/t/p/w500"

//MARK: - Global Variable
var movieModel = Mapper<MovieModel>().map(JSON: [:])

// MARK: - MovieModel

class MovieModel : Mappable{
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: String?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String!
    var id: Int?
    var imdb_id : String?
    var original_language : String?
    var original_title : String?
    var overview: String?
    var popularity: String?
    var poster_path: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [SpokenLanguage]?
    var status : String?
    var tagline : String?
    var title: String?
    var video: Bool?
    var vote_average: String?
    var vote_count: Int?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        belongs_to_collection <- map["belongs_to_collection"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdb_id <- map["imdb_id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        production_companies <- map["production_companies"]
        production_countries <- map["production_countries"]
        release_date <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spoken_languages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
    
    // FIRE API
    class func fireApi(responseData:((_ responseObject:MovieModel?,_ errMsg:String, _ erorCode:Int)->Void)!){
        let request = AF.request("https://api.themoviedb.org/3/movie/550?api_key=dbbb4bd33094a6c2f6a004da32590f17")
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    if let _asJSON = Mapper<MovieModel>().map(JSONObject: asJSON){
                        print(_asJSON)
                        responseData(_asJSON,"",200)
                    }else {
                        responseData(nil,"",200)
                    }
                    
                } catch {
                    print("Error while decoding response: \(error) from: \(String(data: data, encoding: .utf8) ?? "")")
                    responseData(nil,"",response.response?.statusCode ?? 200)
                }
            case .failure(let error):
                print(error)
                responseData(nil,"",response.response?.statusCode ?? 500)
                break
            }
        }
    }
}

// MARK: - Genre
class Genre: Mappable {
    var id: Int?
    var name: String?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

// MARK: - ProductionCompany
class ProductionCompany: Mappable {
    var id: Int?
    var logo_path: String?
    var name : String?
    var origin_country: String?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
        origin_country <- map["origin_country"]
    }
}

// MARK: - ProductionCountry
class ProductionCountry: Mappable {
    var iso_3166_1 : String?
    var name: String?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
    }
}

// MARK: - SpokenLanguage
class SpokenLanguage: Mappable {
    var english_name : String?
    var iso_639_1 : String?
    var name: String?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        english_name <- map["english_name"]
        iso_639_1 <- map["iso_639_1"]
        name <- map["name"]
    }
}




