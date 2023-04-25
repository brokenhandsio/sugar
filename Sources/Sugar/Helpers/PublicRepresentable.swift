import Vapor

public protocol PublicRepresentable {
    associatedtype Public: Content
    func convertToPublic(on req: Request) async throws -> Public
}
