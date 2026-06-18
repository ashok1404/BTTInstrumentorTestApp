import SwiftUI

// MARK: - Scenario 09: guard with early return

struct GuardView: View {
    var item: String? = "hello"
    var body: some View {
        guard let item else {
            return AnyView(Text("Empty"))
        }
        return AnyView(Text(item))
    }
}

/*
 struct GuardView: View {
     var item: String? = "hello"
     var body: some View {
         guard let item else {
             return AnyView(Text("Empty"))   // not injected
         }
         return AnyView(Text(item))
             .bttTrackScreen("\(Self.self)")
     }
 }
 */

struct GuardScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("A guard statement with an early return. The rewriter uses reversed iteration — it injects on the last return (the happy path) and never reaches the guard-fail branch.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            Divider()
            GuardView()
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
        }
        .navigationTitle("Guard")
        .navigationBarTitleDisplayMode(.large)
    }
}

/*
 struct GuardScreen: View {
     var body: some View {
         VStack(alignment: .leading, spacing: 16) { ... }
             .navigationTitle("Guard")
             .navigationBarTitleDisplayMode(.large)
             .bttTrackScreen("\(Self.self)")
     }
 }
 */
