//
//  HttpUtility.swift
//  LongFormTest
//
//  
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void, errorHandler:@escaping(_ error: String)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    debugPrint(result)
                    _=completionHandler(result as T)
                }
                catch let error{
                    debugPrint("error occured while decoding is = \(error.localizedDescription)")
                    _=errorHandler(error.localizedDescription)
                }
            }

        }.resume()
    }

}

