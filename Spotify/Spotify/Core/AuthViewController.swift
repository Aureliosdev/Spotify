//
//  AuthViewController.swift
//  Spotify
//
//  Created by Aurelio Le Clarke on 23.03.2022.
//

import UIKit
import WebKit


class AuthViewController: UIViewController, WKNavigationDelegate {

    private let webviewContent: WKWebView = {
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences  = preferences
        let webView = WKWebView(frame: .zero, configuration: config)
   return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(webviewContent)
        title = "Sign In"
        webviewContent.backgroundColor = .systemBackground
        webviewContent.navigationDelegate = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webviewContent.frame = view.bounds
    }

}
