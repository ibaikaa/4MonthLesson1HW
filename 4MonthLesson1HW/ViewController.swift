//
//  ViewController.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 26/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var customSearchView: CustomSearchView!
    
    
    @IBOutlet weak var productTypesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var openedStoresQuantityLabel: UILabel!
    
    
    
    private var services: [ServiceModel] = [
        .init(
            serviceName: "Delivery",
            serviceIcon: UIImage(systemName: "cube.box.fill")!,
            isActive: true
        ),
        
        .init(
            serviceName: "Pickup",
            serviceIcon: UIImage(systemName: "box.truck.fill")!
        ),
        
        .init(
            serviceName: "Catering",
            serviceIcon: UIImage(systemName: "fork.knife")!
        ),
        
        .init(
            serviceName: "Curbside",
            serviceIcon: UIImage(systemName: "road.lanes.curved.right")!
        ),
        
    ]
    
    
    private var productTypes: [ProductTypeModel] = [
        
        .init(
            productTypeImage: UIImage(named: "Takeaways")!,
            productTypeName: "Takeaways"
        ),
        
        .init(
            productTypeImage: UIImage(named: "Grocery")!,
            productTypeName: "Grocery"
        ),
        
        .init(
            productTypeImage: UIImage(named: "Convenience")!,
            productTypeName: "Convenience"
        ),
    
        .init(
            productTypeImage: UIImage(named: "Pharmacy")!,
            productTypeName: "Pharmacy"
        )
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActionsCollectionView()
        configureSearchBar()
        configureFilterStoresButton()
        configureProductTypesCollectionView()
    }
    
    
    private func configureActionsCollectionView() {
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
        servicesCollectionView.register(
            UINib(
                nibName: String(describing: CustomServiceCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier: CustomServiceCollectionViewCell.reuseId
        )
    }
    
    
    private func configureProductTypesCollectionView () {
        productTypesCollectionView.dataSource = self
        productTypesCollectionView.delegate = self
        productTypesCollectionView.register(
            UINib(
                nibName: String(describing: ProductTypeCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier: ProductTypeCollectionViewCell.reuseID
        )
        let layout = productTypesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 16
    }
    

    private func configureSearchBar() {
        customSearchView.getSearchStoreSearchBar().delegate = self
        customSearchView.getSearchStoreSearchBar().searchTextField.delegate = self
    }
    
    private func configureFilterStoresButton() {
        customSearchView.getFilterStoresButton().addTarget(self, action: #selector(filterStores), for: .touchUpInside)
    }
    
    @objc func filterStores () {
        print("Filter")
    }
    
    
    //Прописал, чтоб скрывать клавиатуру, когда она активна, при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }


}


extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    )
    -> Int {
        if collectionView == servicesCollectionView {
            return services.count
        } else {
            return productTypes.count
        }
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    )
    -> UICollectionViewCell {
        
        if collectionView == servicesCollectionView {
            
            let cell = servicesCollectionView
                .dequeueReusableCell(
                    withReuseIdentifier: CustomServiceCollectionViewCell.reuseId,
                    for: indexPath
                ) as! CustomServiceCollectionViewCell
            
            let serviceNameForCell = services[indexPath.row].serviceName
            let serviceIconForCell = services[indexPath.row].serviceIcon
            let isServiceActive = services[indexPath.row].isActive
            
            
            cell
                .configure(
                    serviceName: serviceNameForCell,
                    serviceIcon: serviceIconForCell,
                    isServiceActive
                )
            
            if isServiceActive {
                cell.backgroundColor = activeServiceBackgroundColor
            } else {
                cell.backgroundColor = nonActiveServiceBackgroundColor
                cell.layer.borderWidth = 1
                cell.layer.borderColor = nonActiveServiceCellBorderColor.cgColor
            }
            
            cell.layer.cornerRadius = 18
            
            return cell
        } else {
            let cell = productTypesCollectionView
                .dequeueReusableCell(
                    withReuseIdentifier: ProductTypeCollectionViewCell.reuseID,
                    for: indexPath
            ) as! ProductTypeCollectionViewCell
            
            cell
                .configure(
                    productTypeName: productTypes[indexPath.row].productTypeName,
                    icon: productTypes[indexPath.row].productTypeImage
                )
            
            print("cell created")
            
            return cell
        }
      
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == servicesCollectionView {
            return CGSize(width: 120, height: 36)
        } else {
            return CGSize(width: 80, height: 100)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == servicesCollectionView {
            services[indexPath.row].isActive = !services[indexPath.row].isActive
            
            for i in 0..<services.count where services[i].serviceName != services[indexPath.row].serviceName && services[i].isActive {
                services[i].isActive = false
            }
            
            servicesCollectionView.reloadData()
        } else {
            print("Product Types Cell tapped. So? ")
        }
        
       
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
