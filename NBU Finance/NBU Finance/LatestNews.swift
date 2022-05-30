import UIKit
import WebKit

class LatestNews: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPage()
    }
    
    func loadPage(){
        let url = URL(string: "https://bank.gov.ua/ua/news")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        loadPage()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        webView.stopLoading()
    }
}
