//
//  EventsModel.swift
//  DSG
//
//  Created by Abhilash on 5/15/21.
//

import Foundation
import UIKit
import CoreData

// MARK: - EventsModel
struct EventsModel: Codable {
    let events: [Event]?
    let meta: Meta?
    let inHand: InHand?

    enum CodingKeys: String, CodingKey {
        case events, meta
        case inHand = "in_hand"
    }
}

// MARK: - Event
struct Event: Codable {
    let type: String?
    let id: Int?
    let datetimeUTC: String?
    let venue: Venue?
    let datetimeTbd: Bool?
    let performers: [Performer]?
    let isOpen: Bool?
    let links: [JSONAny]?
    let datetimeLocal: String?
    let timeTbd: Bool?
    let shortTitle, visibleUntilUTC: String?
    let stats: EventStats?
    let taxonomies: [Taxonomy]?
    let url: String?
    let score: Double?
    let announceDate, createdAt: String?
    let dateTbd: Bool?
    let title: String?
    let popularity: Double?
    let eventDescription, status: String?
    //let accessMethod:Int?
    let eventPromotion: String?
    let announcements: InHand?
    let conditional: Bool?
    let enddatetimeUTC: String?
    let themes, domainInformation: [JSONAny]?
    var isFavourite:Bool = false

    enum CodingKeys: String, CodingKey {
        case type, id
        case datetimeUTC = "datetime_utc"
        case venue
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
        case links
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case stats, taxonomies, url, score
        case announceDate = "announce_date"
        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
        //case accessMethod = "access_method"
        case eventPromotion = "event_promotion"
        case announcements, conditional
        case enddatetimeUTC = "enddatetime_utc"
        case themes
        case domainInformation = "domain_information"
    }
}

// MARK: - InHand
struct InHand: Codable {
}

// MARK: - Performer
struct Performer: Codable {
    let type, name: String?
    let image: String?
    let id: Int?
    let images: PerformerImages?
    //let divisions: Int?
    let hasUpcomingEvents: Bool?
    let primary: Bool?
    let stats: PerformerStats?
    let taxonomies: [Taxonomy]?
    let imageAttribution: String?
    let url: String?
    let score: Double?
    let slug: String?
    //let homeVenueID: JSONNull?
    let shortName: String?
    let numUpcomingEvents: Int?
    //let colors: JSONNull?
    let imageLicense: String?
    let genres: [Genre]?
    let popularity: Int?
    //let location: JSONNull?
    let homeTeam, awayTeam: Bool?

    enum CodingKeys: String, CodingKey {
        case type, name, image, id, images//, divisions
        case hasUpcomingEvents = "has_upcoming_events"
        case primary, stats, taxonomies
        case imageAttribution = "image_attribution"
        case url, score, slug
        //case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        //case colors
        case imageLicense = "image_license"
        case genres, popularity//, location
        case homeTeam = "home_team"
        case awayTeam = "away_team"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name, slug: String?
    let primary: Bool?
    let images: GenreImages?
    let image: String?
    let documentSource: DocumentSource?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, primary, images, image
        case documentSource = "document_source"
    }
}

// MARK: - DocumentSource
struct DocumentSource: Codable {
    let sourceType: String?
    let generationType: String?

    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case generationType = "generation_type"
    }
}


// MARK: - GenreImages
struct GenreImages: Codable {
    let the1200X525, the1200X627, the136X136, the500_700: String
    let the800X320, banner, block, criteo130_160: String
    let criteo170_235, criteo205_100, criteo400_300, fb100X72: String
    let fb600_315, huge, ipadEventModal, ipadHeader: String
    let ipadMiniExplore, mongo, squareMid, triggitFbAd: String

    enum CodingKeys: String, CodingKey {
        case the1200X525 = "1200x525"
        case the1200X627 = "1200x627"
        case the136X136 = "136x136"
        case the500_700 = "500_700"
        case the800X320 = "800x320"
        case banner, block
        case criteo130_160 = "criteo_130_160"
        case criteo170_235 = "criteo_170_235"
        case criteo205_100 = "criteo_205_100"
        case criteo400_300 = "criteo_400_300"
        case fb100X72 = "fb_100x72"
        case fb600_315 = "fb_600_315"
        case huge
        case ipadEventModal = "ipad_event_modal"
        case ipadHeader = "ipad_header"
        case ipadMiniExplore = "ipad_mini_explore"
        case mongo
        case squareMid = "square_mid"
        case triggitFbAd = "triggit_fb_ad"
    }
}

// MARK: - PerformerImages
struct PerformerImages: Codable {
    let huge: String
}

// MARK: - PerformerStats
struct PerformerStats: Codable {
    let eventCount: Int

    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
}

// MARK: - Taxonomy
struct Taxonomy: Codable {
    let id: Int
    let name: String
    let parentID: Int?
    let documentSource: DocumentSource?
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
        case documentSource = "document_source"
        case rank
    }
}

// MARK: - EventStats
struct EventStats: Codable {
    let listingCount, averagePrice: Int?
    //let lowestPriceGoodDeals: JSONNull?
    let lowestPrice, highestPrice, visibleListingCount: Int?
    //let dqBucketCounts: JSONNull?
    let medianPrice, lowestSgBasePrice: Int?
    //let lowestSgBasePriceGoodDeals: JSONNull?

    enum CodingKeys: String, CodingKey {
        case listingCount = "listing_count"
        case averagePrice = "average_price"
        //case lowestPriceGoodDeals = "lowest_price_good_deals"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
        case visibleListingCount = "visible_listing_count"
        //case dqBucketCounts = "dq_bucket_counts"
        case medianPrice = "median_price"
        case lowestSgBasePrice = "lowest_sg_base_price"
        //case lowestSgBasePriceGoodDeals = "lowest_sg_base_price_good_deals"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let nameV2, postalCode, name: String?
    //let state?
    let links: [JSONAny]?
    let timezone: String?
    let url: String?
    let score: Double?
    let location: Location?
    let address, country: String?
    let hasUpcomingEvents: Bool?
    let numUpcomingEvents: Int?
    let city, slug, extendedAddress: String?
    let id, popularity: Int?
    //let accessMethod: Int?
    let metroCode, capacity: Int?
    let displayLocation: String?

    enum CodingKeys: String, CodingKey {
        //case state
        case nameV2 = "name_v2"
        case postalCode = "postal_code"
        case name, links, timezone, url, score, location, address, country
        case hasUpcomingEvents = "has_upcoming_events"
        case numUpcomingEvents = "num_upcoming_events"
        case city, slug
        case extendedAddress = "extended_address"
        case id, popularity
        //case accessMethod = "access_method"
        case metroCode = "metro_code"
        case capacity
        case displayLocation = "display_location"
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double
}

// MARK: - Meta
struct Meta: Codable {
    let total, took, page, perPage: Int
    let geolocation: JSONNull?

    enum CodingKeys: String, CodingKey {
        case total, took, page
        case perPage = "per_page"
        case geolocation
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

extension Event {
    func isFavouriteExistsInDB() -> Bool {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
        request.predicate = NSPredicate(format: "id = %d", (self.id ?? 0))
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                return true
            }
        } catch  {
            print(error.localizedDescription)
            return false
        }
        return false
    }
}
