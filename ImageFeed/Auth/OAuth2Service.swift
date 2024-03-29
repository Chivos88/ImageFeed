//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Илья Чемоданов on 14.11.2023.
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private let urlSession = URLSession.shared
    private (set) var authToken: String? {
        get {
            return OAuth2TokenStorage().token
        }
        set {
            OAuth2TokenStorage().token = newValue
        }
    }
    func fetchOAuthToken(
        _ code: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        let request = authTokenRequest(code: code)
        let task = object(for: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let body):
                let authToken = body.accessToken
                self.authToken = authToken
                
                completion(.success(authToken))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
extension OAuth2Service {
    private struct OAuthTokenResponseBody: Decodable {
        let accessToken: String
        let tokenType: String
        let scope: String
        let createdAt: Int
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case scope
            case createdAt = "created_at"
        }
    }
    
    private func object(
        for request: URLRequest,
        completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void
    ) -> URLSessionTask {
        let decoder = JSONDecoder()
        return urlSession.data(for: request) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
            do {
            let object = try decoder.decode(
            OAuthTokenResponseBody.self,
            from: data
            )
            completion(.success(object))
            } catch {
            completion(.failure(error))
            }
            case .failure(let error):
            completion(.failure(error))
            }
        }
    }
    private func authTokenRequest(code: String) -> URLRequest {
        let bodyData = ["client_id": accessKey,
                    "client_secret": secretKey,
                    "redirect_uri": redirectURI,
                    "code": code,
                    "grant_type":"authorization_code"]
        
        var request = URLRequest.makeHTTPRequest(
            path: "/oauth/token",
            httpMethod: "POST"
        )
        do {
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData, options: [])
        }
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
}
