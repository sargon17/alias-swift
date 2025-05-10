//
//  ContentView.swift
//  alias
//
//  Created by Mykhaylo Tymofyeyev  on 09/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var wordDefinition: WordElement?

    var body: some View {
        VStack {
            Text(wordDefinition?.word ?? "No word")
            Text(wordDefinition?.phonetics?.filter({ $0.text != nil }).first?.text ?? "No phonetic")
        }
        .task {
            do {
                let wordDefinitions = try await getWordDefinition()
                wordDefinition = wordDefinitions.first
            } catch {
                print("Failed to fetch word definition: \(error)")
            }
        }.onChange(of: wordDefinition) {
            print(wordDefinition)
        }
    }

    func getWordDefinition() async throws -> [WordElement] {
        let endpoint = "https://api.dictionaryapi.dev/api/v2/entries/en/hello"
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decodedData = try JSONDecoder().decode([WordElement].self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }

}
