# Swift `Charts`

## Example 1

<img width="1277" alt="Screen Shot 2023-02-23 at 10 59 58 AM" src="https://user-images.githubusercontent.com/1819208/220961879-da430922-1eb4-4da0-b8e2-f8e9f6f37499.png">

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
        VStack(alignment: .center, spacing: 8) {
            Text("IRONMAN Nice 🇫🇷")
                .font(.title)
            Text("Bike Elevation (First 2 sections of 4)")
            Chart(Workout.data) { workout in
                BarMark(
                    x: .value("Segment", workout.segment),
                    y: .value("Elevation", workout.elevation)
                )
                .annotation(position: .top) {
                    Text("\(workout.elevation) feet")
                }
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

***

## Example 3

![Screen Shot 2023-03-14 at 3 30 32 PM](https://user-images.githubusercontent.com/1819208/225116640-340e0c5a-c2de-4788-814b-1c1d3acc5657.png)


try? it out 

```swift
//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul
//

import SwiftUI
import Charts

struct Segment: Identifiable {
    let section: Int
    let power: Int
    let duration: Int

    var id: UUID { UUID() }

    static var data: [Segment] {
        [
            .init(
                section: 0,
                power: 160,
                duration: 20
            ),
            .init(
                section: 1,
                power: 225,
                duration: 60
            ),
            .init(
                section: 2,
                power: 160,
                duration: 20
            ),
            .init(
                section: 3,
                power: 225,
                duration: 60
            ),
            .init(
                section: 4,
                power: 160,
                duration: 20
            )
        ]
    }
}

struct SegmentChart: View {
    var body: some View {
        Chart(Segment.data) { segment in
            BarMark(
                x: .value("Section", segment.section),
                y: .value("Power", segment.power),
                width: .init(integerLiteral: segment.duration)
            )
            .annotation(position: .top) {
                Text("\(segment.power) watts")
                    .font(.caption2)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        SegmentChart()
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
