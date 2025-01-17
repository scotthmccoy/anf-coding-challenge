//
//  ANFAPI.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//

import Foundation

enum ANFAPIError: Error, Equatable {
    case invalidUrl
    case networkError(NetworkError)
    case codableHelperError(CodableHelperError)
}

protocol ANFAPIProtocol: Sendable {
    func get() async -> Result<[Product], ANFAPIError>
    func get(url: URL) async -> Result<[Product], ANFAPIError>
}

final class ANFAPI: ANFAPIProtocol {

    static let singleton = ANFAPI()
    
    @MainActor var apiUrlString = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.css"
    
    private let network: NetworkProtocol
    private let codableHelper: CodableHelperProtocol
    
    init(
        network: NetworkProtocol = Network(),
        codableHelper: CodableHelperProtocol = CodableHelper()
    ) {
        self.network = network
        self.codableHelper = codableHelper
    }
    
    func get() async -> Result<[Product], ANFAPIError> {
        
        guard let url = await URL(string: apiUrlString) else {
            return .failure(.invalidUrl)
        }
        
        let urlRequest = URLRequest(url: url)
        
        // Use private method to get products
        return await get(urlRequest: urlRequest)
    }
    
    // Alternative method. Uses any URL. Useful for loading from the Bundle.
    func get(
        url: URL
    ) async -> Result<[Product], ANFAPIError> {
        
        let urlRequest = URLRequest(url: url)
        
        return await get(urlRequest: urlRequest)
    }
    
    // MARK: - Private
    private func get(
        urlRequest: URLRequest
    ) async -> Result<[Product], ANFAPIError> {
        
        return await network.requestData(
            urlRequest: urlRequest
        ).mapError {
            // Wrap NetworkError
            .networkError($0)
        }.flatMap {
            // Convert Data to Result<APIResponseDataObject, APIError>
            codableHelper.decode(
                type: [ProductDataObject].self,
                from: $0
            )
            // Wrap CodableHelperError
            .mapError {
                .codableHelperError($0)
            }
        }
        .map {
            // Convert Data objects to domain objects
            $0.compactMap {
                $0.product
            }
        }

    }
}
