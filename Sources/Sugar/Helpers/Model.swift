import Fluent
import Vapor

public extension Model {
//    func createOrUpdate(
//        given filters: [FilterOperator<Self.Database, Self>],
//        withSoftDeleted: Bool = false,
//        restore: Bool = false,
//        on db: DatabaseConnectable
//    ) throws -> Future<Self> {
//        var query = Self.query(on: db, withSoftDeleted: withSoftDeleted)
//
//        for filter in filters {
//            query = query.filter(filter)
//        }
//
//        return query.first().flatMap(to: Self.self) { result in
//            guard let result = result else {
//                return self.create(on: db)
//            }
//
//            var copy = self
//            copy.fluentID = result.fluentID
//            copy.fluentCreatedAt = result.fluentCreatedAt
//            copy.fluentDeletedAt = result.fluentDeletedAt
//
//            let future = copy.update(on: db)
//
//            guard restore else {
//                return future
//            }
//
//            return future.flatMap { $0.restore(on: db) }
//        }
//    }
}
