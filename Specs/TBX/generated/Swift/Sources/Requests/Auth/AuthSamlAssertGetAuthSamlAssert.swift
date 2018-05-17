//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TBX.Auth {

    public enum AuthSamlAssertGetAuthSamlAssert {

        public static let service = APIService<Response>(id: "auth.samlAssert__get_auth_saml_assert", tag: "auth", method: "GET", path: "/auth/saml/assert", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var sAMLResponse: String?

                public var relayState: String?

                public init(sAMLResponse: String? = nil, relayState: String? = nil) {
                    self.sAMLResponse = sAMLResponse
                    self.relayState = relayState
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: AuthSamlAssertGetAuthSamlAssert.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(sAMLResponse: String? = nil, relayState: String? = nil) {
                let options = Options(sAMLResponse: sAMLResponse, relayState: relayState)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let sAMLResponse = options.sAMLResponse {
                  params["SAMLResponse"] = sAMLResponse
                }
                if let relayState = options.relayState {
                  params["RelayState"] = relayState
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Request was successful */
            case status200([String: Any])

            public var success: [String: Any]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(TBX.dateFormatter)
                switch statusCode {
                case 200: self = try .status200(decoder.decodeAny([String: Any].self, from: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
