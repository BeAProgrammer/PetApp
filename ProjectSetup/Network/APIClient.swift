//
//  APIClient.swift
//
//  Created by Prashant Telangi on 2/4/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient {
    func performRequest<T: Decodable>(config: APIConfiguration, decode: @escaping (Decodable) -> T?, completion: @escaping  (Result<T, ErrorResponse>) -> Void)
}

extension APIClient {
    typealias CompletionHandler = (Decodable?, ErrorResponse?) -> Void
    
    func decodingTask<T: Decodable>(with config: URLRequest, decodingType: T.Type, completionHandler completion: @escaping  CompletionHandler) {
        
        if !Connectivity.isConnectedToInternet {
            completion(nil, self.generateErroModel(true))
        } else {
            AF.request(config)
                .responseJSON { (response) in
                    
                    switch response.result {
                    case .success:
                        
                        if response.response?.isResponseOK() ?? false {
                            do {
                                
                                if let data = response.data {
                                    
                                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                    print(json ?? "")

                                } else {
                                    
                                    print(response)
                                    
                                }
                                                                
                                if let data = response.data {
                                    let dataModel = try JSONDecoder().decode(decodingType, from: data)
                                    completion(dataModel, nil)
                                    
                                } else {
                                    completion(nil, self.generateErroModel())
                                }
                            } catch {
                                completion(nil, self.generateErroModel())
                            }
                        } else if response.response?.statusCode == 500 {
                            completion(nil, self.generateErroModel())
                        } else {
                            fallthrough
                        }
                        
                    case .failure :
                        do {
                            print(response)
                            if let data = response.data {
                                let errors = try JSONDecoder().decode([String: [String: [ErrorResponse]]].self, from: data)
                                guard let error = errors.values.first?.values.first else {
                                    completion(nil, self.generateErroModel())
                                    return
                                }
                                completion(nil, error[0])
                                
                            } else {
                                
                                completion(nil, self.generateErroModel())
                            }
                            
                        } catch {
                            completion(nil, self.generateErroModel())
                        }
                    }
            }
        }
    }
    
    func performRequest<T: Decodable>(config: APIConfiguration, decode: @escaping (Decodable) -> T?, completion: @escaping  (Result<T, ErrorResponse>) -> Void) {
        do {
            try decodingTask(with: config.asURLRequest(), decodingType: T.self) { (json, error) in
                
                DispatchQueue.main.async {
                    guard let json = json else {
                        if let error = error {
                            completion(Result.failure(error))
                        } else {
                            completion(Result.failure(self.generateErroModel()!))
                        }
                        return
                    }
                    if let value = decode(json) {
                        completion(.success(value))
                    } else {
                        completion(Result.failure(self.generateErroModel()!))
                    }
                }
            }
        } catch {
            completion(Result.failure(self.generateErroModel()!))
        }
    }
    
    func generateErroModel(_ noInternet: Bool = false) -> ErrorResponse? {
        if noInternet {
            return ErrorResponse(messageCode: "", message: LocalizedStringConstant.noInternetConnection)
        } else {
            return ErrorResponse(messageCode: "", message: LocalizedStringConstant.somethingWentWrong)
        }
    }
}
