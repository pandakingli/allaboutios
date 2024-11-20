

import Foundation

struct GeometryModel: Codable {
    let type: String
    let coordinates: [Float]
}

struct PropertyModel: Codable {
    let mag: Float
    let place: String
    let time: Int64
    let updated: Int64
    let tz: Int?
    let url: String
    let detail: String
    let felt: Int
    let cdi: Float
    let mmi: Float
    let alert: String
    let status: String
    let tsunami: Int
    let sig: Int
    let net: String
    let code: String
    let ids: String
    let sources: String
    let types: String
    let nst: Int
    let dmin: Float
    let rms: Float
    let gap: Int
    let magType: String
    let type: String
    let title: String
}

struct FeaturedataModel: Codable {
    let type: String
    let id: String
    let properties: PropertyModel
    let geometry: GeometryModel
}

struct MetadataModel: Codable {
    let generated: Int64
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}

struct RspDataModel: Codable {
    let type: String
    let metadata: MetadataModel
    let features: [FeaturedataModel]
    let bbox:[Float]
}
