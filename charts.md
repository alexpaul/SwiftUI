# Swift `Charts`

## Example 1

![Screen Shot 2023-02-19 at 11 15 07 AM](https://user-images.githubusercontent.com/1819208/219960467-d33c4b6f-2783-4883-97d2-2f8ec53b68eb.png)


try? it out 

```swift
import SwiftUI
import Charts

struct Workout: Identifiable {
    let segment: String
    let elevation: Int

    var id: String { segment }

    static var data: [Workout] {
        [
            .init(segment: "First", elevation: 2392), // feet
            .init(segment: "Second", elevation: 3293)
            // TODO
            // "Third" and "Fourth" sections 🎉 🏔 🚴🏾
        ]
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("IRONMAN Nice Bike Elevation (First 2 sections of 4)")
            Chart(Workout.data) { workout in
                BarMark(
                    x: .value("Segment", workout.segment),
                    y: .value("Elevation", workout.elevation)
                )
            }
            .chartYAxisLabel("Elevation (Feet)")
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

## Example 2

![Screen Shot 2022-11-01 at 10 56 34 AM](https://user-images.githubusercontent.com/1819208/199264080-aa7dc3f0-8dcf-43c6-b551-bbf5f48084fb.png)


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

    var totalDistance: Double {
        mileage.reduce(0) { partialResult, mileage in
            partialResult + mileage.distance
        }
    }

    var body: some View {
        VStack {
            Text("October Run Mileage \(Int(totalDistance)) miles")
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
