import UIKit
import WebKit

class WebViewCoordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {

    var parent: ComposedWebView

    init(_ uiWebView: ComposedWebView) {
        self.parent = uiWebView
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        return decisionHandler(.allow)
    }

    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        print(message.name)
        switch message.name {
            case "navigate": self.processNavigateBridge(message.body)
            case "logout": self.processIsRightButtonEnabledBridge(message.body)
            default: break
        }
    }

    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }

}

extension WebViewCoordinator {

    private func processNavigateBridge(_ messageBody: Any) {
        guard let messageBody = try? MessageBodyDecoder.share.decode(NavigateResponse.self, from: messageBody) else {
            return
        }
        print(messageBody)
        self.parent.state.naviagteLink = messageBody.id
        self.parent.state.needsToNavigate = true
    }
    
    private func processIsRightButtonEnabledBridge(_ messageBody: Any) {
        guard let messageBody = try? MessageBodyDecoder.share.decode(LogOutResponse.self, from: messageBody) else {
            return
        }
        print(messageBody)
        print(self.parent.state.isRightButtonEnabled)
    }
}
