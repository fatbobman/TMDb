import Foundation

enum DiscoverEndpoint {

    static let basePath = URL(string: "/discover")!

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, page: Int? = nil)
    case tvShows(sortedBy: TVShowSort? = nil, page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    var path: URL {
        switch self {
        case .movies(let sortedBy, let people, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingPage(page)

        case .tvShows(let sortedBy, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
        }
    }

}
