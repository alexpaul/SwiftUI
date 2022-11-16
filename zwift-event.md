# Zwift Event 

```swift
import SwiftUI

struct ContentView: View {
    private let eventData =
    """
    This is no leisure tour: be ready to work as you climb over 2000 meters in just under 90 kilometers! And be warned: hitting the Alpe after working your way over the previous climbs proves to be both a mental and physical challenge. Prepare yourself!

    Elevation: 6927 Feet

    Distance: 55.8 miles
    """

    @Environment(\.openURL) private var openURL

    var body: some View {
        ScrollView {
            header
            eventDescription
            resourceLinks
        }
    }

    private var header: some View {
        Group {
            Text("TUESDAY, NOVEMBER 22")
            ZStack {
                Image("fourHorsemen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, -8)
                Text("FOUR HORSEMEN")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: -60, y: -100)
            }
            HStack{}
                .frame(height: 8)
                .frame(maxWidth: .infinity)
                .background(.orange)
                .padding(.top, -10)
        }
    }

    struct RaceGroup: Hashable {
        let color: Color
        let group: String

        static let allGroups: [RaceGroup] = [
            .init(color: .red, group: "A"),
            .init(color: .green, group: "B"),
            .init(color: .blue, group: "C"),
            .init(color: .yellow, group: "D"),
            .init(color: .purple, group: "E")
        ]
    }

    private var eventDescription: some View {
        let diameter: Double = 20
        return Group {
            HStack {
                Text("5:00 AM")
                    .font(.headline)
                    .bold()
                Spacer()
                Text("Birthday Bike Ride 🥳 | 2022")
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text("4 HRS 30 MINS")
                    .font(.headline)
                    .bold()
                Spacer()
                HStack(alignment: .center, spacing: 2) {
                    ForEach(RaceGroup.allGroups, id:\.self) { item in
                        ZStack {
                            Circle()
                                .frame(width: diameter, height: diameter)
                                .foregroundColor(item.color)
                            Text(item.group)
                                .font(.caption)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text("POWER TARGET")
                    .font(.headline)
                    .bold()
                Spacer()
                Text("212 Watts")
            }
            .padding(.horizontal, 20)
            Divider()

            HStack {
                Text("EVENT DESCRIPTION")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            Text(eventData)
                .font(.footnote)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        }
    }

    private var resourceLinks: some View {
        Group {
            HStack {
                Text("RESOURCE LINKS")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            HStack {
                Text("Strava Segment")
                    .onTapGesture {
                        openURL(URL(string: "https://www.strava.com/activities/1748727988")!)
                    }
                Text("|")
                    .foregroundColor(Color(uiColor: .systemGray3))
                Text("Zwift Insider")
                    .onTapGesture {
                        openURL(URL(string: "https://zwiftinsider.com/route/four-horsemen/")!)
                    }
            }
            .foregroundColor(.orange)
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
