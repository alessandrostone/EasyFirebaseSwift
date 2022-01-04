//
//  ViewController+Combine.swift
//  Example
//
//  Created by Fumiya Tanaka on 2022/01/01.
//

import Foundation
import FirebaseFirestore
import EasyFirebaseSwift

extension ViewController {
    func create_combine(message: String) {
        let newModel = Model(
            ref: nil,
            createdAt: nil,
            updatedAt: nil,
            message: message
        )
        newModel.publisher(for: .create).sink { completion in
            print(completion)
        } receiveValue: { }
        .store(in: &cancellables)
    }

    func getSampleDocument_combine() {
        Model.publisher(for: .get(ref: ref)).sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                break
            }
        } receiveValue: { model in
            print(model.message)
        }
        .store(in: &cancellables)
    }
}
