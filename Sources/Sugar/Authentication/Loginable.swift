import Vapor
import Fluent

/// Expresses the ability for a type (e.g. a user type) to be logged in.
public protocol Loginable {

    /// Payload containing the information required to perform a login.
    associatedtype Login

    /// Used to perform any pre-login steps such as validation.
    ///
    /// - Parameter req: the request.
    /// - Returns: a `Future<Void>` signaling success or failure.
    static func preLogin(on req: Request) async throws

    /// Performs the actual login. Called after `preLogin(on:)`.
    ///
    /// - Parameters:
    ///   - login: the login information.
    ///   - worker: a worker on which to perform any database related actions like user lookup.
    /// - Returns: an instance of self in the `Future` on successful login.
    static func logIn(with login: Login, on database: Database) async throws -> Self
}

extension Loginable {

    /// Default implementation that does nothing.
    /// See `Loginable`.
    public static func preLogin(on req: Request) async throws { }
}

extension Loginable where
    Self: ModelCredentialsAuthenticatable,
    Self.Login: HasReadableUsername,
    Self.Login: HasReadablePassword
{
    /// Default implementation that uses functionality provided by `PasswordAuthenticatable`.
    /// See `Loginable`.
    public static func logIn(with login: Login, on database: Database) async throws -> Self {
        guard let user = try await Self.query(on: database).filter(\._$username == login[keyPath: Login.readableUsernameKey]).first() else {
            throw AuthenticationError.userNotFound
        }
        guard try user.verify(password: login[keyPath: Login.readablePasswordKey]) else {
            throw AuthenticationError.userNotFound
        }
        return user
    }
}

extension ModelCredentialsAuthenticatable {
    var _$username: Field<String> {
        self[keyPath: Self.usernameKey]
    }
}

extension Loginable where Self.Login: Decodable {

    /// Convenience function that combines `preLogin` and `logIn`.
    ///
    /// - Parameter req: the request.
    /// - Returns: an instance of self in the `Future` on successful login.
    public static func logIn(on req: Request) async throws -> Self {
        try await preLogin(on: req)
        let login = try req.content.decode(Login.self)
        return try await Self.logIn(with: login, on: req.db)
    }
}
