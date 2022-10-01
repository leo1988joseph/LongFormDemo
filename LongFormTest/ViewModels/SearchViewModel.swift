//
//  SearchViewModel.swift
//  LongFormTest
//
//  
//

import Foundation

protocol SearchViewModelDelegate : AnyObject{
    func didReceiveSearchResponse(searchResponse: SearchElement?)
}

struct SearchViewModel {
    
    weak var delegate : SearchViewModelDelegate?
    
    func searchViewModel(searchRequest: SearchRequest)
    {
        let validationResult = SearchValidation().Validate(searchRequest: searchRequest)
        
        if (validationResult.success)
        {
            let searchResource = SearchResource()
            searchResource.search(searchRequest: searchRequest, completion: { result in
                                
                DispatchQueue.main.async {
                    self.delegate?.didReceiveSearchResponse(searchResponse: result)
                }
            })
        }
        self.delegate?.didReceiveSearchResponse(searchResponse: SearchElement(error: validationResult.error, data: nil))
    }
    
}
