pub async fn handler(
    req: hyper::Request<hyper::Body>,
) -> Result<hyper::Response<hyper::Body>, http_service::errors::Error> {
    match (req.method(), req.uri().path()) {
        (&hyper::Method::GET, "/") => {
            let mut response = hyper::Response::new(hyper::Body::empty());
            *response.body_mut() = hyper::Body::from("GET Response");
            *response.status_mut() = hyper::StatusCode::OK;
            response.headers_mut().append(
                hyper::header::CONTENT_TYPE,
                hyper::http::HeaderValue::from_str("application/json").unwrap(), // TODO: Remove unwrap
            );
            Ok(response)
        }
        (&hyper::Method::POST, "/") => {
            let mut response = hyper::Response::new(hyper::Body::empty());
            *response.body_mut() = hyper::Body::from("POST Response");
            *response.status_mut() = hyper::StatusCode::OK;
            response.headers_mut().append(
                hyper::header::CONTENT_TYPE,
                hyper::http::HeaderValue::from_str("application/json").unwrap(), // TODO: Remove unwrap
            );
            Ok(response)
        }
        _ => todo!(),
    }
}
