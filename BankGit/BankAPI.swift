//
//  BankAPI.swift
//  BankGit
//
//  Created by Александра on 12.01.23.
//

import Foundation
import Moya

enum BankAPI {
    case adress
}

extension BankAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://belarusbank.by/api")!
    }
    
    var path: String {
        switch self {
            case .adress:
                return "/atm"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .adress:
                return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        return .requestParameters(parameters: parameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var params = [String: Any]()
        
        switch self {
            case .adress:
                params["city"] = "Минск"
        }
        
        return params
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .adress:
                return URLEncoding.queryString
        }
    }
    
    
}


