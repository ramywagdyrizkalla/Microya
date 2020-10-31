import Foundation

/// A Plugin receives callbacks to perform side effects wherever a request is sent or received.
///
/// for example, a plugin may be used to
///     - log network requests
///     - hide and show a network activity indicator
///     - inject additional information into a request (like for authentication)
public class Plugin<JsonApiType: JsonApi> {
    /// Called to modify a request before sending.
    func modifyRequest(_ request: URLRequest, endpoint: JsonApiType) -> URLRequest { request }

    /// Called immediately before a request is sent.
    func willPerformRequest(_ request: URLRequest, endpoint: JsonApiType) { /* no-op */ }

    /// Called after a response has been received & decoded, but before calling the completion handler.
    func didPerformRequest<ResultType: Decodable>(
        _ result: JsonApiType.TypedResult<ResultType>,
        endpoint: JsonApiType
    ) { /* no-op */ }
}
