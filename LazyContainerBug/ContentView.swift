//
//  ContentView.swift
//  LazyContainerBug
//
//  Created by 王 巍 on 2021/02/07.
//

import SwiftUI

struct SampleView: View {
    let index: Int
    let suffix: String

    @State private var value: Bool = false

    var body: some View {
        Toggle("Toggle \(index) \(suffix)", isOn: $value)
    }
}

struct ContentView: View {
    let index = 1 ..< 10

    var body: some View {
        ScrollView {
            LazyVStack {

                ForEach(index) { i in
                    // Good
                    SampleView(index: i, suffix: "✅")

                    // Bad. State lost.
                    HStack { SampleView(index: i, suffix: "❌") }
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
