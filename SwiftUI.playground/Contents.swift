import SwiftUI
import PlaygroundSupport

PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())

public struct ContentView: View {
    let deslines = ["status", "mural", "plaque"]
    public var body: some View {
        NavigationView {
            List(deslines, id: \.self) { desline in
                NavigationLink(destination: DetailView(descline: desline)) {
                    Text(desline)
                }
            }
            .navigationBarTitle("Displines")
        }
    }
}

public struct DetailView: View{
    let descline: String
    public var body: some View {
        Text(descline)
    }
}
