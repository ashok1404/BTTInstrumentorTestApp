import SwiftUI

// MARK: - Scenario 17: guard/else with EmptyView, real view after

struct WithGuardAndElseView: View {
    var data: String? = "data"
    var body: some View {
        guard let data else {
            return AnyView(EmptyView())
        }
        return AnyView(Text(data))
    }
}

/*
 struct WithGuardAndElseView: View {
     var data: String? = "data"
     var body: some View {
         guard let data else {
             return AnyView(EmptyView())   // not injected
         }
         return AnyView(Text(data))
             .bttTrackScreen("\(Self.self)")
     }
 }
 */

struct WithGuardAndElseScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("A guard with EmptyView in the else path and a real view in the happy path. Reversed iteration finds the last return first and injects there — the guard-fail branch is left untouched.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            Divider()
            WithGuardAndElseView()
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
        }
        .navigationTitle("Guard With Else")
        .navigationBarTitleDisplayMode(.large)
    }
}

/*
 struct WithGuardAndElseScreen: View {
     var body: some View {
         VStack(alignment: .leading, spacing: 16) { ... }
             .navigationTitle("Guard With Else")
             .navigationBarTitleDisplayMode(.large)
             .bttTrackScreen("\(Self.self)")
     }
 }
 */
