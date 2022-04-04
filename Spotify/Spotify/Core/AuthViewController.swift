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
       
        guard let url = AuthManager.shared.signURL else { return }
        webviewContent.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webviewContent.frame = view.bounds
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return}
        
        // Exchange the code for access token
           let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else { return}
        webView.isHidden = true
        print("code\(code)")
        AuthManager.shared.ExchangeForToken(code: code) { [ weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
    }
}
