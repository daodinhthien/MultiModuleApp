//
//  ChatModuleService.swift
//  ChatModule
//
//  Created by ThienDD9 on 20/02/2025.
//

public protocol ChatModuleProtocol: AnyObject {
    func getMessage() -> String?
}

public class ChatModuleService: ChatModuleProtocol {
    public init(){}
    public func getMessage() -> String? {
        return "Hello"
    }
}
