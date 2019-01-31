//
//  HeroViewController.swift
//  HeroisMarvel
//
//  Created by Matheus Nishi on 21/01/19.
//  Copyright © 2019 Matheus Nishi. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: hero.urls.first!.url) {
            let request = URLRequest(url: url)
            title = hero.name
            webView.allowsBackForwardNavigationGestures = true
            webView.navigationDelegate = self
            webView.load(request)
        }
    }

}

extension HeroViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
