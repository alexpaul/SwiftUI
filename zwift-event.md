# Zwift Event 

```swift
import SwiftUI

struct ContentView: View {
    private let eventData =
    """
    This is no leisure tour: be ready to work as you climb over 2000 meters in just under 90 kilometers! And be warned: hitting the Alpe after working your way over the previous climbs proves to be both a mental and physical challenge. Prepare yourself!

    Elevation: 6927 Feet

    Distance: 55.8 miles

    Power Target: > 200 Watts

    Duration: < 4:30 Hours
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

    private var eventDescription: some View {
        Group {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
