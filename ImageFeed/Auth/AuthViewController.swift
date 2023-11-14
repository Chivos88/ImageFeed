//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Илья Чемоданов on 26.10.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private let webViewIdentificator = "ShowWebView"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == webViewIdentificator {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else { fatalError("Failed to prepare for \(webViewIdentificator)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true, completion: nil)
    }
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        print(code)
        let oAuth = OAuth2Service()
        oAuth.fetchOAuthToken(code) {result in
            switch result {
            case .success(let data):
                print("Success: \(data)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
