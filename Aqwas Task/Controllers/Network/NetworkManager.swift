//
//  NetworkManager.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/12/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import Alamofire

enum Environment {
    case dev
    case testing
    case prod
}

class NetworkManager {
    struct Configuration {
        var parameters: [String: Any]?
        var urlParameters: String = ""
        var url: URLs
        var method: HTTPMethod
        var cache: Bool = false

        static var environment: Environment = .prod

        var urlString: String {
            let baseURL = (Configuration.environment == .prod) ? "https://wainnakel.com/api/v1/" : "https://dev-url-for-the-project"
            return "\(baseURL)\(url.rawValue)\(urlParameters.isEmpty ? "" : "/" + urlParameters)"
        }
    }

    static var rawResponse: NSDictionary?

    static var headers: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded",
                "Accept": "application/json"]
                //"Authorization": "",
                //"Content-language": L102Language.currentAppleLanguage().contains("ar") ? "ar" : "en",
    }

    class func makeRequest<T: Decodable>(configuration: Configuration, completion: @escaping (_ response: APIResponse<T>) -> Void) {
        rawResponse = nil

        let unWrappedParameters = configuration.parameters ?? [String: Any]()

        Alamofire.SessionManager.default.session.configuration.requestCachePolicy = configuration.cache ? .returnCacheDataElseLoad : .useProtocolCachePolicy

        Alamofire.request(
            configuration.urlString,
            method: configuration.method,
            parameters: unWrappedParameters,
            encoding: URLEncoding.default,
            // (method == .post ? JSONEncoding.default :
            headers: headers
        )

        //            .validate()
        .validate(contentType: ["text/json"])

        .responseJSON {
            response in
            print(response)
            debugPrint(response)

            rawResponse = nil

            if let data = response.request?.httpBody {
                print(String(data: data, encoding: .utf8) ?? "")
            }

            let validatedResponse: APIResponse<T> = self.validateResponseForAPI(response: response)

            completion(validatedResponse)
        }
    }

    private class func validateResponseForAPI<T: Decodable>(response: DataResponse<Any>) -> APIResponse<T> {
        switch response.result
        {
        case let .success(result):
            guard
                let JsonArray = result as? NSDictionary,
                var obj: APIResponse<T> = JsonArray.getObject()
            else {
                return APIResponse(sucess: false, message: "Unable to parse object", data: nil)
            }
            rawResponse = JsonArray

            obj.sucess = (200 ... 300).contains(response.response?.statusCode ?? 0)
            if let error = parseError(JsonArray) {
                obj.message = error
            }
            return (obj)

        case let .failure(result):
            rawResponse = nil
            // Log
            print("Failure Response: \(result)")
            if let err = result as? URLError, err.code == .notConnectedToInternet {
                return (APIResponse(sucess: false, message: "No internet", data: nil))
            }
            else {
                return (APIResponse(sucess: false, message: "Unknown Error", data: nil))
            }
        }
    }

    private class func parseError(_ rawResponse: NSDictionary) -> String? {
        guard let error = rawResponse["errors"] as? NSDictionary else { return nil }
        let firstElement = error.allValues.first as? [String]
        return firstElement?.first
    }

    static func download(url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, progress _: ((_ progress: Progress) -> Void)?, completion: @escaping (_ response: Any?) -> Void) {
        Alamofire.request(
            url,
            method: method,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: headers
        ).responseData {
            response in

            if response.error == nil {
                completion(response.data)
            }
            else {
                completion(nil)
            }
        }
    }
}

extension NetworkManager.Configuration {
    init(parameters: [String: Any]?, url: URLs, method: HTTPMethod) {
        self.url = url
        self.method = method
        self.parameters = parameters
    }
}
