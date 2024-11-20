
import Foundation
import UIKit
import WebKit
class EarthMapWebVC: UIViewController, WKUIDelegate {
    var weburl: String?
    var webtitle: String?
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if weburl != nil {
            let myURL = URL(string:weburl!)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
        
        if webtitle != nil {
            self.title = webtitle
        }

    }}
