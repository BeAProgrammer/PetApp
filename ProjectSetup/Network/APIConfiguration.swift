//
//  APIConfiguration.swift
//
//  Created by Prashant Telangi on 2/4/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    
    var requestType: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var requestHttpBody: Data? {get}
}

extension APIConfiguration {
    func asURLRequest() throws -> URLRequest {
        let baseURL = URLConstants.baseUrl
        let url =  String(format: "%@%@", baseURL, path)
        let urlwithPercent = url.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        var urlRequest = URLRequest(url: URL(string: urlwithPercent!)!)
        
        // Http method
        urlRequest.httpMethod = requestType.rawValue
        
        //common headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        urlRequest.timeoutInterval  = 30
        
//        if let key = SESSIONDATA.sessionKey {
//            let sessionKey = "Bearer " + key
//            urlRequest.setValue( sessionKey, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
//        }
        
        if requestHttpBody != nil {
            urlRequest.httpBody = requestHttpBody
        } else if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

extension HTTPURLResponse {
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}
