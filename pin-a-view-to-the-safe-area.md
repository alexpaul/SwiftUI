# Pin a view to an edge of the safe area 

![Screenshot 2024-07-19 at 12 55 56 PM](https://github.com/user-attachments/assets/174c7026-0e49-4dfe-acd7-39693bfaed99)

```swift
struct WWDC24: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("What’s new for Apple developers")
                .font(.largeTitle)
                .padding(.bottom, 20)
            Text("Learn about the key technologies and exciting capabilities available in the latest SDKs for Apple platforms.")
                .multilineTextAlignment(.center)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("apple-intelligence-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    VStack {
                        Text("Apple Intelligence")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text("Apple Intelligence is the personal intelligence system that puts powerful generative models right at the core of your iPhone, iPad, and Mac. It powers incredible new features to help people communicate, work, and express themselves.\n\nWriting Tools are available system-wide, and help users rewrite, proofread, and summarize text. The Image Playground API delivers an easy-to-use experience where people can create fun, playful images right in your app. Genmoji bring fun new ways to communicate by providing the ability to create an emoji for any occasion. And Siri will be able to access text displayed in your app, and take hundreds of new actions in and across apps using the App Intents you make available.")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.primary, in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
        }
        .clipped() // avoids showing content in the status bar when scrolling
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
        .safeAreaInset(edge: .top) {
            VStack {
                Spacer()
                    .frame(height: 40)
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .foregroundColor(.whiteBase)
                    Image("vision-home-large")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    var body: some View {
        WWDC24()
    }
}

#Preview {
    ContentView()
}
```
