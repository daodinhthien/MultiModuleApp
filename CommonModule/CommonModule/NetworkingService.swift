//
//  Net.swift
//  CommonModule
//
//  Created by ThienDD9 on 21/02/2025.
//

import Foundation

public enum HTTPMethod: String {
    case PUT
    case POST
    case GET
    case DELETE
    
}

public enum ContentType: String {
    case json = "application/json"
    case xml = "application/xml"
    case urlencoded = "application/x-www-form-urlencoded"
}

public enum NetworkError: Error {
    case badURL
    case requestFailed
    case invalidResponse
    case noData
    case decodingError
}

public class NetworkingService: NSObject {
    public static let share = NetworkingService()
    
    private let baseURl = "https://api.example.com/"
    private let session = URLSession.shared
    
    public func request<T: Decodable>(
        urlString: String,
        method: HTTPMethod = .GET,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        complete: @escaping ((Result<T, NetworkError>) -> Void)
    ) {
        
        guard let url = URL(string: urlString) else {
            complete(.failure(.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if method == .PUT || method == .POST, let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        session.dataTask(with: request) { data, response, error in
            
            // Kiểm tra lỗi
            if let error = error {
                complete(.failure(.requestFailed))
                print("Request failed with error: \(error.localizedDescription)")
                return
            }
            
            // Kiểm tra phản hồi HTTP
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                complete(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complete(.failure(.noData))
                return
            }
            
            do
            {
                let result = try JSONDecoder().decode(T.self, from: data)
                complete(.success(result))
            }
            catch {
                complete(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}
