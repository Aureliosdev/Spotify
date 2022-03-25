//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Aurelio Le Clarke on 23.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let SignInButton: UIButton = {
        let button  = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign in with Spotiy", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(SignInButton)
        SignInButton.addTarget(self, action: #selector(didTapSign), for: .touchUpInside)
        
     
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SignInButton.frame = CGRect(x: 20,
                                    y: view.height-50-view.safeAreaInsets.bottom,
                                    width: view.width-40,
                                    height: 50)
    }

    @objc func didTapSign() {
        
        let vc = AuthViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
