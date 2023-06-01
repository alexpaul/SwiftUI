# Test Data 

## `Art`

```swift
struct Art {
    let image: String
    let description: String

    static var testData: [Art] {
        [
            .init(image: "person", description: "Person"),
            .init(image: "baseball", description: "Baseball"),
            .init(image: "party.popper", description: "Party")
        ]
    }
}
```

## `Phrase`

```swift
struct Phrase {
    let french: String
    let english: String

    static var testData: [Phrase] {
        [
            .init(
                french: "Au Revoir",
                english: "Goodbye"
            ),
            .init(
                french: "Merci",
                english: "Thank you"
            ),
            .init(
                french: "Oui",
                english: "Yes"
            ),
            .init(
                french: "Bonjour",
                english: "Hello / Good day"
            ),
            .init(
                french: "Excusez-moi",
                english: "Excuse me / Pardon"
            ),
            .init(
                french: "Bonne nuit",
                english: "Good night"
            ),
            .init(
                french: "Bonsoir",
                english: "Good evening"
            ),
            .init(
                french: "Je ne comprends pas",
                english: "I don't understand"
            ),
            .init(
                french: "Merci beaucoup",
                english: "Thank you very much"
            ),
        ]
    }
}
```
