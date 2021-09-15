//
//  AddTrackingCodePresenter.swift
//  Adapters
//
//  Created by Iorgers Almeida on 13/09/21.
//

import ShipmentsTrackerCore
import Foundation

public class AddTrackingCodePresenter:
    AddTrackingCodeResult {

    var view: AddTrackingCodeView

    public init(_ view: AddTrackingCodeView){
        self.view = view
    }

    public func addTrackingCodeSucess() {
        self.view.addTrackingCodeResultsInError = nil
    }

    public func addTrackingCodeInvalid() {
        self.view.addTrackingCodeResultsInError = ErrorViewModel(title: "Código Inválido", message: "Tente novamente, por favor")
    }

    public func addTrackingCodeNotFound() {
        self.view.addTrackingCodeResultsInError = ErrorViewModel(
            title: "Hum...",
            message: "O código não foi encontrado, sua encomenda pode não ter sido postada ainda, aguarde")
    }

    public func addTrackingCodeDuplicated() {
        self.view.addTrackingCodeResultsInError = ErrorViewModel(title: "Código Duplicado", message: "Esse código já está sendo rastreado.")
    }

    public func addTrackingCodeNoResponse() {
        self.view.addTrackingCodeResultsInError = ErrorViewModel(title: "Erro", message: "Sem reposta do servidor, tente novamente mais tarde")
    }

}
