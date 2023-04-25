import Vapor

public protocol Updatable {
    associatedtype Update
    func preUpdate(on req: Request) async throws
    func update(_ update: Update) throws
}

extension Updatable {
    public func preUpdate(on req: Request) async throws { }
}

extension Updatable where Update: Decodable {
    public func applyUpdate(on req: Request) async throws -> Self {
        try await preUpdate(on: req)
        let data = try req.content.decode(Update.self)
        try update(data)
        return self
    }
}
