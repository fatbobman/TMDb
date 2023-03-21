import Foundation

enum DiscoverEndpoint {

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, genre: [Genre.ID]? = nil,page: Int? = nil)
    case tvShows(sortedBy: TVShowSort? = nil, page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case .movies(let sortedBy, let people,let genre, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingWithGenre(genre)
                .appendingPage(page)

        case .tvShows(let sortedBy, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
        }
    }

}
