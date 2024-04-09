//
//  TopicDetailView.swift
//  investment 101
//
//  Created by Celine Tsai on 9/8/23.
//

import SwiftUI
import WebKit

struct TopicDetailView: View {
    var topic: Topic
    
    @State private var isQuizButtonClicked = false
    @State private var htmlMessage = ""
    
    var body: some View {
        VStack {
            WebView(url: topic.articleURL, messageHandler: $htmlMessage)
                .frame(height: UIScreen.main.bounds.height)
            
            Button(action: {
                isQuizButtonClicked = true
            }) {
                Text("Quiz time!!")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                    .background(Color(#colorLiteral(red: 0.0431372549, green: 0.1411764706, blue: 0.2784313725, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.top, 30)
            }
            .fullScreenCover(isPresented: $isQuizButtonClicked) {
                NavigationView {
                    QuizView(questions: topic.questions, currentID: topic.id, isQuizButtonClicked: $isQuizButtonClicked)
                        .navigationBarTitle("Quiz", displayMode: .inline)
                        .navigationBarItems(leading: Button("Back") {
                            isQuizButtonClicked = false
                        })
                }
                .transition(.move(edge: .trailing)) // Slide from right to left
            }
        }
        .onAppear {
            WebViewManager.shared.setupMessageHandler(handler: htmlMessageHandler)
        }
    }
    
    private func htmlMessageHandler(message: String) {
        if message == "quiz" {
            isQuizButtonClicked = true
        }
    }
}

// This struct represents a SwiftUI view that wraps a WKWebView and displays a web page.
struct WebView: UIViewRepresentable {
    let url: URL  // The URL of the web page to be loaded.
    @Binding var messageHandler: String  // A binding to a message handler.

    // This function creates and configures the WKWebView.
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        // Initialize the shared WebViewManager (this could be a custom manager).
        WebViewManager.shared.setupWebView(webView)
        
        return webView
    }

    // This function updates the view by loading the URL into the WKWebView.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    // This function creates a coordinator for handling any necessary navigation delegate methods.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // This class is a coordinator that conforms to WKNavigationDelegate.
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        // Initialize the coordinator with a reference to the parent WebView.
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // You can implement navigation delegate methods here if needed.
    }
}


struct TopicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTopic = Topic(id: 3, name: K.unit3, articleURL: K.article21URL, questions: K.quiz21, imgID: "img3")
        return TopicDetailView(topic: sampleTopic)
    }
}
