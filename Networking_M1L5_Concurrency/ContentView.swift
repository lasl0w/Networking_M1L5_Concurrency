//
//  ContentView.swift
//  Networking_M1L5_Concurrency
//
//  Created by tom montgomery on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            print("\(Thread.current) Start onAppear work")
            // use a task block to invoke async work
            Task {
                await longTask()
                print("\(Thread.current) After long task")
                
                await MainActor.run {
                    // use MainActor.run if you need to force it back to the main thread
                    print("Update some elements of the view")
                }

            }
            print("\(Thread.current) Other non async work")
        }
    }
    
    func longTask() async {
        print("\(Thread.current) Long Task")
    }
}

#Preview {
    ContentView()
}
