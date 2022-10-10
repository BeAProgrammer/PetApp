//
//  SerializableExtension.swift

import Foundation

protocol Serializable: Codable {

    func serialize() -> Data?

    func convertToDictionary(data: Data?) -> [String: Any]?

}

extension Serializable {

    func serialize() -> Data? {

        let encoder = JSONEncoder()

        do {

            let data = try encoder.encode(self)

            return data

        } catch {

            return nil
        }
    }

    func convertToDictionary(data: Data?) -> [String: Any]? {

        if let data = data {

            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }

        return nil
    }
}
