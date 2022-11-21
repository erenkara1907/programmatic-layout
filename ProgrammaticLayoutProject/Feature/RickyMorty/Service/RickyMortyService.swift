//
//  RickyMortyService.swift
//  ProgrammaticLayoutProject
//
//  Created by Eren Kara on 21.11.2022.
//

import Alamofire

enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortyService {
    func fetchAllData(response: @escaping ([Result]?) -> Void)
}

struct RickyMortyService: IRickyMortyService {
    func fetchAllData(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: RickyMortyModel.self) { (model) in
            guard let data = model.value else {
                // err
                response(nil)
                return
            }
            
            response(data.results)
        }
    }
}
