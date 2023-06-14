import UIKit
import SwiftUI
import WebKit
import RxCocoa
import RxSwift
import Combine

struct ComposedWebView: UIViewRepresentable {

    @ObservedObject var state: XWebKitState

    private let refreshControl = UIRefreshControl()

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {

        let webView = WKWebView(frame: CGRect.zero, configuration: generateWKWebViewConfiguration())
        webView.navigationDelegate = context.coordinator
        webView.scrollView.delegate = context.coordinator
        self.setLoadingProgress(webView: webView)
        self.setEvaluateJavaScript(webView: webView)
//        self.setRefreshControl(webView: webView)

        if let url = URL(string: self.state.urlString) {
            print(url)
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) { }

}

extension ComposedWebView {

    private func generateWKWebViewConfiguration() -> WKWebViewConfiguration {

        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false

        let configuration = WKWebViewConfiguration()

        self.registerBridge(name: [
            "navigate",
            "logout"
        ], configuration: configuration)

        return configuration
    }

    private func setWebCookie(cookie: [String: String], configuration: WKWebViewConfiguration) {
        let dataStore = WKWebsiteDataStore.nonPersistent()
        cookie.forEach {
            dataStore.httpCookieStore.setCookie(HTTPCookie(properties: [
                .domain: ".xquare.app",
                .path: "/",
                .name: $0.key,
                .value: $0.value,
                .secure: "TRUE",
                HTTPCookiePropertyKey("HttpOnly"): true
            ])!)
        }
        configuration.websiteDataStore = dataStore
    }

    private func registerBridge(name: [String], configuration: WKWebViewConfiguration) {
        name.forEach {
            configuration.userContentController.add(self.makeCoordinator(), name: $0)
        }
    }
}

extension ComposedWebView {

    private func setEvaluateJavaScript(webView: WKWebView) {

        self.state.$naviagteRightButtonTap
            .compactMap { $0 }
            .sink { _ in
                print("navigate")
                self.evaluateJavaScript(
                    webView: webView,
                    bridgeName: "navigate",
                    data: "{ }"
                )
            }
            .store(in: &self.state.cancellables)

        self.state.$naviagteRightButtonTap
            .compactMap { $0 }
            .sink { _ in
                print("navigate")
                self.evaluateJavaScript(
                    webView: webView,
                    bridgeName: "logout",
                    data: "{ }"
                )
            }
            .store(in: &self.state.cancellables)
    }

    private func evaluateJavaScript(webView: WKWebView, bridgeName: String, data: String) {
        DispatchQueue.main.async {
            webView.evaluateJavaScript(
                """
                window.dispatchEvent(new CustomEvent('\(bridgeName)XBridge', {
                    detail: \(data)
                }));
                """
            )
        }
    }

    private func setLoadingProgress(webView: WKWebView) {
        Task {
            let progress = webView.rx.estimatedProgress.values
            for try await now in progress {
                self.state.loadingProgress = now
                if now == 1 {
                    self.state.isLoadingHidden = true
                    self.refreshControl.endRefreshing()
                }
            }
        }
    }

    private func setRefreshControl(webView: WKWebView) {
        Task {
            let refresh = self.refreshControl.rx.controlEvent(.valueChanged).values
            for try await _ in refresh {
                await webView.configuration.websiteDataStore.httpCookieStore.setCookie(HTTPCookie(properties: [
                    .domain: ".xquare.app",
                    .path: "/",
                    .name: "accessToken",
                    .value: self.state.accessTokenGetter(),
                    .secure: "TRUE",
                    HTTPCookiePropertyKey("HttpOnly"): true
                ])!)
                webView.reload()
            }
        }
        webView.scrollView.addSubview(self.refreshControl)
    }
}
