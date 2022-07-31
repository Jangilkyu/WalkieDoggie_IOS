//
//  RestProcessor.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/30.
//

import Foundation

protocol RestProcessorRequestDelegate: AnyObject {
    func didFailToPrepareReqeust(_ result: RestProcessor.Results)
    func didReceiveResponseFromDataTask(_ result: RestProcessor.Results)
}

class RestProcessor {
    
    var reqeustHttpHeaders = RestEntity()
    var urlQueryParameters = RestEntity()
    var httpBodyParameters = RestEntity()

    var httpBody: Data?

    let urlSession: URLSession

    weak var requestDelegate: RestProcessorRequestDelegate?

    init(
        _ session: URLSession = URLSession(configuration: .default)
    ) {
        self.urlSession = session
    }
    
    // MARK: - Preparing Requests
    private func prepareRequest(
        withURL url: URL?,
        httpBody: Data?,
        httpMethod: HttpMethod
    ) -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        for (header, value) in reqeustHttpHeaders.allValues() {
            request.setValue(value, forHTTPHeaderField: header)
            
            request.httpBody = httpBody
        }
        return request
    }
    
    func makeRequest(
        toURL url: URL,
        withHttpMethod httpMethod: HttpMethod
    ) {
        let targetURL = self.addURLQueryParameters(toURL: url)
        let httpBody = (httpMethod == .get)
        ? nil
        : self.getHttpBody()
        guard let request =
                self.prepareRequest(
                    withURL: targetURL,
                    httpBody: httpBody,
                    httpMethod: httpMethod) else {
            
            let error = Results(withError: CustomError.failedToCreateRequest)
            
            /// delegate error call back
            requestDelegate?.didFailToPrepareReqeust(error)
            return
        }
        
        let task = urlSession.dataTask(
            with: request) { (data, response, error) in
                let result = Results(
                    withData: data,
                    response: Response(fromURLResponse: response),
                    error: error)
                /// delegate success call back
                self.requestDelegate?.didReceiveResponseFromDataTask(result)
            }
        task.resume()
    }
    
    // MARK: addURLQueryParameters
    private func addURLQueryParameters(toURL url: URL) -> URL {
        if urlQueryParameters.totalItems() > 0 {
            guard var urlComponents = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false) else { return url}
            var queryItems = [URLQueryItem]()
            
            for (key, value) in urlQueryParameters.allValues() {
                let item = URLQueryItem(
                    name: key,
                    value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
                queryItems.append(item)
            }
            
            urlComponents.queryItems = queryItems
            guard let updatedURL = urlComponents.url else { return url }
            return updatedURL
        }
        
        return url
    }
    
    // MARK: getHttpBody
    private func getHttpBody() -> Data? {
        guard let contentType = reqeustHttpHeaders.value(forKey: "Content-Type") else { return nil }
        
        if contentType.contains("application/json") {
            return try? JSONSerialization.data(
                withJSONObject: httpBodyParameters.allValues(),
                options: [.prettyPrinted, .sortedKeys])
        } else if contentType.contains("application/x-www-form-urlencoded") {
            let bodyString = httpBodyParameters.allValues().map {
                // key= value
                "\($0)=\(String(describing: $1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)))"
            }.joined(separator: "&")
            
            return bodyString.data(using: .utf8)
        } else {
            return httpBody
        }
    }
}
