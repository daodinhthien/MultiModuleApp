//
//  LoadingIndicator.swift
//  LoadingModule
//
//  Created by ThienDD9 on 21/02/2025.
//

import UIKit

public class LoadingIndicator {

    // Tạo một instance duy nhất của LoadingIndicator
    public static let shared = LoadingIndicator()

    // Loading view
    private var loadingView: UIView?

    // Tạo một UIActivityIndicatorView
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    // Tạo UIView chứa ActivityIndicator và Text
    private init() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        loadingView?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        activityIndicator.center = CGPoint(x: loadingView!.frame.size.width / 2, y: loadingView!.frame.size.height / 2)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        loadingView!.addSubview(activityIndicator)
        
        // Tạo một UILabel để hiển thị văn bản loading (tùy chọn)
        let label = UILabel(frame: CGRect(x: 0, y: loadingView!.frame.size.height / 2 + activityIndicator.frame.size.height/2 , width: loadingView!.frame.size.width, height: 30))
        label.text = "Đang tải..."
        label.textAlignment = .center
        label.textColor = .white
        loadingView?.addSubview(label)
    }
    
    // Hàm để hiển thị loading indicator
    public func show() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            guard let self = self, let window = self.getWindow() else { return }
            window.addSubview(self.loadingView!)
            self.loadingView?.isHidden = false
        }
    }
    
    // Hàm để ẩn loading indicator
    public func hide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            guard let self = self else { return }
            self.loadingView?.isHidden = true
            self.loadingView?.removeFromSuperview()
        }
        
    }
    
    func getWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene {
                return windowScene.windows.first(where: { $0.isKeyWindow })
            }
        }
        else {
            return UIApplication.shared.keyWindow
        }
        return nil
    }
}
