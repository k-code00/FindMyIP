//
//  NetworkManager.swift
//  FindMyIP
//
//  Created by Kojo on 21/11/2023.
//

import Foundation
import Alamofire

func fetchIPInformation(completion: @escaping (Result<IPInformation, Error>) -> Void) {
    let url = "https://ipapi.co/json/"

    AF.request(url).responseDecodable(of: IPInformation.self) { response in
        switch response.result {
        case .success(let ipInfo):
            completion(.success(ipInfo))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
