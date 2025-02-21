//
//  KeyChainService.swift
//  CommonModule
//
//  Created by ThienDD9 on 21/02/2025.
//

import Security

public enum KeychainServiceId: String {
    case commonService = "com.thiendd.CommonModule.CommonService"
    case loginService = "com.thiendd.CommonModule.LoginService"
}

public class KeyChainService: NSObject {
    
    public func saveToKeychain(service: String, account: String, password: String) -> Bool {
        let data = password.data(using: .utf8)!
        
        // Đặt các thuộc tính cho item cần lưu vào Keychain
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]
        
        // Kiểm tra xem item có tồn tại không, nếu có thì cập nhật, nếu không thì thêm mới
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecDuplicateItem {
            // Nếu item đã tồn tại, update nó
            let updateQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account
            ]
            
            let updateAttr: [String: Any] = [
                kSecValueData as String: data
            ]
            
            SecItemUpdate(updateQuery as CFDictionary, updateAttr as CFDictionary)
        }
        
        return getDataFromKeychain(service: service, account: account) != nil
    }
    
    public func getDataFromKeychain(service: String, account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    public func deleteDataFromKeychain(service: String, account: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        
        SecItemDelete(query as CFDictionary)
        
        return getDataFromKeychain(service: service, account: account) == nil
    }
}
