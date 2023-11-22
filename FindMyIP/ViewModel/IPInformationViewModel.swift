//
//  IPInformationViewModel.swift
//  FindMyIP
//
//  Created by Kojo on 21/11/2023.
//

import Foundation
import Combine

class IPInformationViewModel: ObservableObject {
    @Published var ipInformation: IPInformation?
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var showAlert = false

    func getIPInformation() {
        self.isLoading = true
        fetchIPInformation { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let info):
                    self?.ipInformation = info
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
}
