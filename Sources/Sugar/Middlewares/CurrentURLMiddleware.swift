//import Vapor
//
//public final class CurrentURLProvider: Provider {
//    public init() {}
//
//    public func register(_ services: inout Services) throws {
//        services.register { _ in
//            return CurrentURLContainer()
//        }
//    }
//
//    public func didBoot(_ container: Container) throws -> Future<Void> {
//        return .done(on: container)
//    }
//}
//
//public final class CurrentURLContainer: Codable, Service {
//    public var path: String = ""
//}
//
//public struct CurrentURLMiddleware: AsyncMiddleware {
//    let path: String
//    public init(path: String = "") {
//        self.path = path
//    }
//    
//    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
//        
//    }
//
//    /// See Middleware.respond
//    public func respond(to req: Request, chainingTo next: Responder) throws -> Future<Response> {
//        let container = try req.privateContainer.make(CurrentURLContainer.self)
//        container.path = req.http.urlString
//        return try next.respond(to: req)
//    }
//}
