//
//  CustomSearchView.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 26/12/22.
//

import UIKit


class CustomSearchView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    
    
    @IBOutlet weak var searchStoreSearchBar: UISearchBar!
    
    
    @IBOutlet weak var filterStoresButton: UIButton!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContentView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSearchStoreSearchBar()
        filterStoresButton.setTitle("", for: .normal)
  
        
    }
    
    private func setupSearchStoreSearchBar() {
        searchStoreSearchBar.layer.borderColor = UIColor.white.cgColor
        searchStoreSearchBar.layer.borderWidth = 1
        searchStoreSearchBar.searchTextField.backgroundColor = .clear
        searchStoreSearchBar.placeholder = "Find store by name"
    }
    
    private func setupContentView () {
        Bundle.main.loadNibNamed(String(describing: CustomSearchView.self), owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public func getSearchStoreSearchBar() -> UISearchBar { searchStoreSearchBar }
    
    public func getFilterStoresButton() -> UIButton { filterStoresButton }
    
    
}
