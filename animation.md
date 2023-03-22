# Animation 

> [Apple docs on Animation](https://developer.apple.com/documentation/swiftui/animations): You tell SwiftUI how to draw your app’s user interface for different states, and then rely on SwiftUI to make interface updates when the state changes. To avoid abrupt visual transitions when the state changes, add animation in one of the following ways:

* Animate all of the visual changes for a state change by changing the state inside a call to the `withAnimation(_:_:)` global function.

* Add animation to a particular view when a specific value changes by applying the `animation(_:value:)` view modifier to the view.

* Animate changes to a `Binding` by using the binding’s `animation(_:)` method.



> Mario animations all inspired by my son's love for all things Mario. He can't wait for the Super Mario Bros movie coming April 2023. 

## Example 1 - using `.animation`

![mario-searching-ui](https://user-images.githubusercontent.com/1819208/212473166-d5460075-e6fd-498e-987f-1c55ac425fe6.gif)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    // 1
    // "Source of truth" to be monitored for changes
    @State private var isAnimating = false

    let diameter: CGFloat = 90

    var body: some View {
        VStack {
            Image("mario")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: diameter, height: diameter)
                // 2
                // here we want to animate the `y` offset (up and down animation)
                .offset(y: isAnimating ? -80 : -10)
                // 3
                // animation call with `easeInOut` curve
                // also an animation `duration` is supplied along with `repeatForever`
                // `repeatForever` `autoreverses` param is set to `true` by default causing
                // the animation to reverse and continue indefinitely
                .animation(
                    .easeInOut(duration: 0.6).repeatForever(),
                    value: isAnimating
                )
            Text("Searching...")
        }
        .onAppear {
            // 4
            // starts on appearance of the `View`
            isAnimating = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Example 2 - using `withAnimation`

![reveal-more-animation](https://user-images.githubusercontent.com/1819208/212593830-2640485e-6a84-4669-a9ae-7f23c1dcd1d1.gif)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    let introContent = "The Super Mario Bros. Movie is an upcoming computer-animated fantasy adventure comedy film based on the Mario video game franchise published by Nintendo, who also co-produced the film with Illumination and its distributor Universal Pictures."
    let moreContent = """
    The Super Mario Bros. Movie is an upcoming computer-animated fantasy adventure comedy film based on the Mario video game franchise published by Nintendo, who also co-produced the film with Illumination and its distributor Universal Pictures. It is the franchise’s third film adaptation, following the Japanese anime film Super Mario Bros.: The Great Mission to Rescue Princess Peach! (1986) and the American live-action film Super Mario Bros. (1993). Directed by Aaron Horvath and Michael Jelenic (in Jelenic's feature directorial debut) from a screenplay by Matthew Fogel, the film features an ensemble voice cast including Chris Pratt and Charlie Day as the titular brothers, alongside Anya Taylor-Joy, Jack Black, Keegan-Michael Key, Seth Rogen, Fred Armisen, Sebastian Maniscalco, Charles Martinet and Kevin Michael Richardson.

    After the critical and commercial failure of the 1993 film, Nintendo was reluctant to license its intellectual properties for film adaptations. Mario creator Shigeru Miyamoto became interested in developing another film when Nintendo was bringing its older games to the Virtual Console service, and through Nintendo's work with Universal Parks & Resorts to create Super Nintendo World, he met Illumination founder Chris Meledandri. By 2016, the two were discussing a Mario film and in January 2018, Nintendo announced that it would collaborate with Illumination and Universal to produce it. Production was underway by 2020, and the cast was publicly announced in September 2021. A teaser trailer for the film and the first official trailer were shown via Nintendo Direct presentations on October 6, 2022, and November 29, 2022, respectively.

    The Super Mario Bros. Movie is scheduled for release in the United States on April 7, 2023, and in Japan on April 28.
    """

    @State private var isShowingMoreContent = false

    var body: some View {
        ScrollView {
            VStack {
                Image("super-mario-bros-movie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 20)
                HStack {
                    Text("The Super Mario Bros. Movie")
                        .bold()
                    Image(systemName: isShowingMoreContent ? "chevron.up" : "chevron.down")
                }
                .padding(.bottom, 20)
                    .onTapGesture {
                        // 1
                        // we add a `withAnimation` block when State changes, namely `isShowingMoreContent`
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isShowingMoreContent.toggle()
                        }
                    }
                VStack {
                    Text(isShowingMoreContent ? moreContent : introContent)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .overlay(
                    Rectangle()
                        .foregroundColor(.clear)
                        .border(.gray, width: 1)
                )
                .background(.background)
                .shadow(radius: 8)
                .padding(.horizontal, 20)
                Button(action:{}) {
                    Text("Buy Tickets")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.blue)
                .cornerRadius(24)
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Example 3 - using `.transition`

![transition-animation](https://user-images.githubusercontent.com/1819208/226891506-994e1613-3779-4466-956b-a7d38da3d43b.gif)


try? it out 

```swift
import SwiftUI

struct ContentView: View {
    @State private var isTransitioning = false

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Group {
                if isTransitioning {
                    Image("clock")
                } else {
                    Image("swiftui-logo")
                }
            }
            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
            Spacer()
            Button(action: {
                isTransitioning.toggle()
            }) {
                Text("Transition")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Resources 

* [Apple docs: Animations](https://developer.apple.com/documentation/swiftui/animations)
* [Apple docs: `withAnimation`](https://developer.apple.com/documentation/swiftui/withanimation(_:_:)/)
* [Apple docs: `animation`](https://developer.apple.com/documentation/swiftui/view/animation(_:value:))
* [Apple docs: `.transition`](https://developer.apple.com/documentation/swiftui/view/transition(_:))
