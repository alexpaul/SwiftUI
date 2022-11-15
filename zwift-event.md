# Zwift Event 

```swift
import SwiftUI

struct ContentView: View {
    private let eventDescription =
    """
    This is no leisure tour: be ready to work as you climb over 2000 meters in just under 90 kilometers! And be warned: hitting the Alpe after working your way over the previous climbs proves to be both a mental and physical challenge. Prepare yourself!

    Elevation: 6927 Feet

    Duration: Approximately 4 Hours
    """

    var body: some View {
        ScrollView {
            Text("TUESDAY, NOVEMBER 22")
            ZStack {
                Image("fourHorsemen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, -8)
                Text("FOUR HORSEMEN")
                    .font(.title)
                    .offset(x: -80, y: -100)
            }
            HStack{}
                .frame(height: 8)
                .frame(maxWidth: .infinity)
                .background(.orange)
                .padding(.top, -10)
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
            Text(eventDescription)
                .font(.footnote)
                .padding(.horizontal, 20)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
