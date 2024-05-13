//
//  JokeService.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/5/13.
//

import Foundation
private actor JokeServiceStore {
  private var loadedJoke = Joke(value: "")
  private var url: URL {
    urlComponents.url!
  }

  private var urlComponents: URLComponents {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.chucknorris.io"
    components.path = "/jokes/random"
    components.setQueryItems(with: ["category": "dev"])
    return components
  }

  func load() async throws -> Joke {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else { throw DownloadError.statusNotOk }
    guard let decodedResponse = try? JSONDecoder().decode(
      Joke.self, from: data)
    else { throw DownloadError.decoderError }
    loadedJoke = decodedResponse
    // Joke(value: decodedResponse.value)
    return loadedJoke
  }
}

class JokeService: ObservableObject {
  @Published private(set) var joke = "Joke appears here"
  @Published private(set) var isFetching = false
  private let store = JokeServiceStore()

  public init() { }
}

enum DownloadError: Error {
  case statusNotOk
  case decoderError
}

extension JokeService {
  @MainActor
  func fetchJoke() async throws {
    isFetching = true
    defer { isFetching = false }

    let loadedJoke = try await store.load()
    joke = loadedJoke.value
  }
}

struct Joke: Codable {
  let value: String
}

public extension URLComponents {
  /// Maps a dictionary into `[URLQueryItem]` then assigns it to the
  /// `queryItems` property of this `URLComponents` instance.
  /// From [Alfian Losari's blog.](https://www.alfianlosari.com/posts/building-safe-url-in-swift-using-urlcomponents-and-urlqueryitem/)
  /// - Parameter parameters: Dictionary of query parameter names and values
  mutating func setQueryItems(with parameters: [String: String]) {
    self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
  }
}
