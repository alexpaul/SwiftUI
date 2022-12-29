# Using `@Binding`to propagate changes to a Parent View

![Screen Shot 2022-12-29 at 1 24 31 PM](https://user-images.githubusercontent.com/1819208/209993936-5de2b530-6d5a-46b6-ac3e-8b6a9e5e79c6.png)


try? it out 

```swift 
import SwiftUI

struct NotesEditor: View {
    // 3.
    // This creates a "two-way" binding between `NotesView` and `ContentView`
    // Whenever a "new note" is added to `notes` SwiftUI will re-render the `ContentView`
    @Binding var notes: [String]

    @Environment(\.dismiss) private var dismiss
    @State private var newNote = ""

    var body: some View {
        VStack {
            Text("Enter your note below")
                .padding(.top, 20)
            TextEditor(text: $newNote)
                .border(.gray)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)
                .lineSpacing(5)
            Button(action: addNewNote) {
                Text("Save")
            }
        }
    }

    private func addNewNote() {
        notes.insert(newNote, at: 0)
        dismiss()
    }
}

struct ContentView: View {
    @State private var isPresented = false

    // 1.
    // "Source of truth" for the list
    @State private var notes = [
        "Prepare Swift presentation",
        "Get kids ready for swimming"
    ]

    var body: some View {
        NavigationStack {
            VStack {
                List(notes, id: \.self) { note in
                    Text(note)
                }
                .listStyle(.plain)
                Button(action: showNotesEditor) {
                    Text("Add new note")
                }
                .sheet(isPresented: $isPresented) {
                    // 2.
                    // Here we are passing the `notes` array as a "binding"
                    // using the `$` prefix.
                    // A binding is required to have the child view `NotesEditor`
                    // reflect changes up to its parent view `ContentView`
                    NotesEditor(notes: $notes)
                        .presentationDetents([
                            .medium
                        ])
                }
            }
            .navigationTitle("Notes")
        }
    }

    private func showNotesEditor() {
        isPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
