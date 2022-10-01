//
//  SearchResource.swift
//  LongFormTest
//
//  
//

import Foundation

struct SearchResource
{
    func search(searchRequest: SearchRequest, completion : @escaping (_ result: SearchElement?) -> Void)
    {
        let httpUtility = HttpUtility()

        let searchEndpoint = "\(ApiEndpoints.search)?sf=\(searchRequest.sf!)"

        let requestUrl = URL(string:searchEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: SearchResponses.self) { (searchApiResponse) in

            if searchApiResponse != nil
            {
                if searchApiResponse!.count > 0
                {
                    _ = completion(SearchElement(error: nil, data: searchApiResponse![0]))
                }
                else
                {
                    _ = completion(SearchElement(error: Constants.EmptyResult, data: nil))

                }
            }
            else
            {
                _ = completion(SearchElement(error: Constants.SomeErrorOccured, data: nil))
            }
            
        } errorHandler: {
            (errorString) in
            _ = completion(SearchElement(error: errorString, data: nil))
        }
    }
}
