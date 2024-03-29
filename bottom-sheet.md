# Bottom Sheet using `presentationDetents`

> Note: [presentationDetents](https://developer.apple.com/documentation/charts/chart/presentationdetents(_:)) in SwiftUI is available in iOS 16+, for iOS 15 support see [UIKit's implementation](https://github.com/alexpaul/UIKit/blob/main/bottom-sheet.md).

## 1. Example 

![Screen Shot 2023-01-29 at 8 04 53 AM](https://user-images.githubusercontent.com/1819208/215328004-8d81d4b2-0e53-40e6-ab0f-d11aca823bda.png)

try? it out 

```swift
import SwiftUI

// MARK: - Profile Model

struct Profile: Equatable {
    let image: String
    let name: String

    static var mockData: [Profile] {
        [
            .init(image: "swift",
                  name: "Swift"
            ),
            .init(image: "wakanda",
                  name: "Wakanda Forever"
            ),
            .init(image: "super-mario-bros-movie",
                  name: "Mario"
            ),
            .init(image: "year-of-the-rabbit",
                  name: "Year of the Rabbit 🧧 🐇"
            ),
            .init(image: "javascript",
                  name: "JavaScript"
            ),
        ]
    }
}

// MARK: - View Model

final class ProfileViewModel: ObservableObject {
    @Published var profiles: [Profile] = []
    @Published var selectedProfile = Profile.mockData[0]

    init() {
        profiles = Profile.mockData
    }
}

// MARK: - Profie Row

struct RadioButton: View {
    var outerDiameter: CGFloat = 24 // default value
    var innerDiameter: CGFloat = 14 // default value

    @EnvironmentObject var viewModel: ProfileViewModel

    let profile: Profile

    var body: some View {
        Button(action: {
            viewModel.selectedProfile = profile
        }) {
            Circle()
                .strokeBorder(isSelectedProfile ? .blue : .gray, lineWidth: 2)
                .background(
                    Circle()
                        .frame(width: innerDiameter, height: innerDiameter)
                        .foregroundColor(isSelectedProfile ? .blue : .clear)
                )
                .frame(width: outerDiameter, height: outerDiameter)
        }
    }

    private var isSelectedProfile: Bool {
        profile == viewModel.selectedProfile
    }
}

struct ProfileImage: View {
    let profile: Profile

    var body: some View {
        Image(profile.image)
            .resizable()
            .frame(width: 44, height: 44)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(22)
        Text(profile.name)
            .font(.headline)
    }
}

struct ProfileRow: View {
    let profile: Profile

    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                ProfileImage(profile: profile)
                Spacer()
                RadioButton(profile: profile)
                    .environmentObject(viewModel)
                    .onChange(of: viewModel.selectedProfile) {[weak viewModel] _ in
                        guard let viewModel else { return }
                        viewModel.selectedProfile = profile
                    }
            }
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Profile List

struct ProfileList: View {
    @State private var isRowDisabled = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text("Your Profiles")
                    .font(.headline)
                    .padding(.top, 40)
                Divider()
                ForEach(viewModel.profiles, id: \.image)  { profile in
                    ProfileRow(profile: profile)
                        .environmentObject(viewModel)
                        .onChange(of: viewModel.selectedProfile,
                                  perform: { [weak viewModel] selected in
                            guard let viewModel else { return }
                            isRowDisabled = true
                            viewModel.selectedProfile = selected
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                dismiss()
                            }
                        })
                    .disabled(isRowDisabled)
                }
            }
        }
    }
}

// MARK: - Main View

struct ContentView: View {
    @ObservedObject private var viewModel = ProfileViewModel()
    @State private var isBottomSheetPresented = false

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ProfileImage(profile: viewModel.selectedProfile)
                    Spacer()
                    Image(systemName: "chevron.down.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            isBottomSheetPresented.toggle()
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding(.vertical, 60)
                .sheet(isPresented: $isBottomSheetPresented) {
                    ProfileList()
                        .onChange(of: viewModel.selectedProfile,
                                  perform: { [weak viewModel] profile in
                            guard let viewModel else { return }
                            viewModel.selectedProfile = profile
                        })
                        .environmentObject(viewModel)
                        .presentationDetents([
                            .fraction(0.4),
                            .medium,
                            .large
                        ])
                }
                Image(viewModel.selectedProfile.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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

<a href="https://www.buymeacoffee.com/alexpaulnyc" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

***

## 2. Example 

![Screen Shot 2023-01-25 at 9 09 07 PM](https://user-images.githubusercontent.com/1819208/214742369-2d019134-94b8-4bbb-8cd5-92382cbba87c.png)

![Screen Shot 2023-01-25 at 9 11 27 PM](https://user-images.githubusercontent.com/1819208/214742516-3e850899-24c8-4b9e-aba0-622a5915ab6f.png)

![Screen Shot 2023-01-25 at 9 11 39 PM](https://user-images.githubusercontent.com/1819208/214742530-ef2bfe45-d58f-4155-8a28-51459f94014f.png)

try? it out

```swift
import SwiftUI

struct ContactsView: View {
    private var names = [
        "Reginald", "Holman", "Elexis", "Gardner",
        "Hakeem", "Flynn", "Hayleigh", "Holton",
        "Mario", "Garber", "Norman", "Longo",
        "Zara", "Newkirk", "Leilani", "Hopper",
        "Diego", "Cheney", "Joel", "Comstock"
    ]
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            // Available in iOS16+
            .scrollIndicators(.hidden)
            HStack {
                Button(action: {}) {
                    Text("Send")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(.blue)
                .cornerRadius(12)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ContentView: View {
    @State private var message = ""
    @State private var isPresented = false

    var body: some View {
        VStack {
            Spacer()
            Image("xrOS")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                TextField("Send Message", text: $message)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .padding()
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .sheet(isPresented: $isPresented) {
                        ContactsView()
                            // Available in iOS16+
                            .presentationDetents([
                                .medium,
                                .large
                            ])
                    }
            }
            .frame(height: 80)
            .background(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
