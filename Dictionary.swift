import Foundation
import SwiftData

struct WordElement: Codable, Equatable {
    var word: String
    var phonetic: String?
    var phonetics: [Phonetic]?
    var origin: String?
    var meanings: [Meaning]?
}

struct Phonetic: Codable, Equatable {
    var text: String?
    var audio: String?
}

struct Meaning: Codable, Equatable {
    var partOfSpeech: String?
    var definitions: [Definition]?
}

struct Definition: Codable, Equatable {
    var definition: String?
    var example: String?
    var synonyms: [String]?
    var antonyms: [String]?
}

// [
//     {
//       "word": "hello",
//       "phonetic": "həˈləʊ",
//       "phonetics": [
//         {
//           "text": "həˈləʊ",
//           "audio": "//ssl.gstatic.com/dictionary/static/sounds/20200429/hello--_gb_1.mp3"
//         },
//         {
//           "text": "hɛˈləʊ"
//         }
//       ],
//       "origin": "early 19th century: variant of earlier hollo ; related to holla.",
//       "meanings": [
//         {
//           "partOfSpeech": "exclamation",
//           "definitions": [
//             {
//               "definition": "used as a greeting or to begin a phone conversation.",
//               "example": "hello there, Katie!",
//               "synonyms": [],
//               "antonyms": []
//             }
//           ]
//         },
//         {
//           "partOfSpeech": "noun",
//           "definitions": [
//             {
//               "definition": "an utterance of 'hello'; a greeting.",
//               "example": "she was getting polite nods and hellos from people",
//               "synonyms": [],
//               "antonyms": []
//             }
//           ]
//         },
//         {
//           "partOfSpeech": "verb",
//           "definitions": [
//             {
//               "definition": "say or shout 'hello'.",
//               "example": "I pressed the phone button and helloed",
//               "synonyms": [],
//               "antonyms": []
//             }
//           ]
//         }
//       ]
//     }
//   ]
