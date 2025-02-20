//
//  PayModuleService.swift
//  PayModule
//
//  Created by ThienDD9 on 20/02/2025.
//

public protocol PayModuleServiceProtocol: AnyObject {
    func getName() -> String?
}

public class PayModuleService: PayModuleServiceProtocol {
    public init(){}
    
    public func getName() -> String? {
        return "Thiện"
    }
}
