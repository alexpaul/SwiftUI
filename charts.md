# Swift `Charts`

![Screen Shot 2022-10-31 at 6 18 32 PM](https://user-images.githubusercontent.com/1819208/199120943-49d966bd-d6b7-4981-8dcb-bef4cc5573b8.png)


```swift
import SwiftUI
import Charts

struct Mileage {
    var week: String
    var distance: Double
    var id = UUID()
}

struct ContentView: View {
    let mileage: [Mileage] = [
        .init(week: "Week 1", distance: 45.70),
        .init(week: "Week 2", distance: 48.22),
        .init(week: "Week 3", distance: 45.66),
        .init(week: "Week 4", distance: 33.13)
    ]

    var body: some View {
        VStack {
            Text("October Run Mileage 2022")
                .font(.headline)
            Chart(mileage, id: \.id) { item in
                BarMark(
                    x: .value("Week", item.week),
                    y: .value("Mileage", item.distance)
                )
            }
            .foregroundColor(.green)
            .padding(.bottom, 20)
            Chart(mileage, id: \.id) { item in
                LineMark(
                    x: .value("Week", item.week),
                    y: .value("Mileage", item.distance)
                )
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

## Resources 

* [Apple docs: Swift Charts](https://developer.apple.com/documentation/charts)
