//
//  ViewController.swift
//  LongFormTest
//
//  
//

import UIKit

class HomeViewController: BaseViewController, SearchViewModelDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var textShortForm: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    private var searchViewModel = SearchViewModel()
    var searchedObject: SearchResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableList.dataSource = self
        self.tableList.delegate = self
    }
    
    @IBAction func btnSearchActionClicked(_ sender: Any) {
        let request = SearchRequest(sf: self.textShortForm.text)
        searchViewModel.delegate = self
        searchViewModel.searchViewModel(searchRequest: request)
        self.textShortForm.resignFirstResponder()
    }
    
    func didReceiveSearchResponse(searchResponse: SearchElement?) {
        if (searchResponse?.error != nil)
        {
            self.tableList.isHidden = true
            self.lblError.text = searchResponse?.error
        }
        else
        {
            self.tableList.isHidden = false
            print(searchResponse?.data)
            searchedObject = searchResponse?.data
            self.tableList.reloadData()

        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let sectionName: String
        switch section {
            case 0:
            sectionName = "\(Constants.CellSectionTitle) \(searchedObject?.lfs?.count ?? 0)"
            
            default:
                sectionName = ""
        }
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedObject?.lfs?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableCell
        
        cell.lblLongform.text = "\((searchedObject?.lfs?[indexPath.row].lf)!)"
        cell.lblOccurances.text = "\(Constants.CellLabel) \((searchedObject?.lfs?[indexPath.row].vars?.count)!)"
        
        return cell
    }
    
}
