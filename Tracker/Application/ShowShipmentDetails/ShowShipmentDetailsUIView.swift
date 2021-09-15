//
//  ContentView.swift
//  ShipmentsTracker
//
//  Created by Iorgers Almeida on 05/09/21.
//

import SwiftUI
import ShipmentsTrackerAdapters

struct ShowShipmentDetailsUIView: View {

    var viewModel: ShipmentDetailsViewModel

    init(_ viewModel: ShipmentDetailsViewModel){
        self.viewModel = viewModel
    }

    init(){
        self.viewModel = ShipmentDetailsViewModel.example
    }

    var body: some View {
        NavigationView {
            List {

                if self.viewModel.identifier != nil {
                    Section(header: Text("Identificação")) {

                        HStack{
                            Text(self.viewModel.identifier!)
                            Spacer()
                            Image(systemName: "pencil")
                        }
                    }.textCase(nil)
                }

                DetailSection(
                    title: "Situação",
                    content: self.viewModel.status)

                DetailSection(
                    title: "Código de Rastreio",
                    content: self.viewModel.trackingCode)

                HistorySection(for: viewModel.trackingSteps).textCase(nil)
            }
            .navigationTitle("Detalhes")
            .listStyle(GroupedListStyle())
        }
    }
}

struct DetailSection: View {

    var title: String
    var content: String?

    var body: some View {
        Section(header: Text(title)){
           Text(content ?? "Not defined")
       }.textCase(nil)
   }
}

struct HistorySection: View {

    var logs: [TrackingStepViewModel]

    var body: some View {
        Section (header: Text("Histórico")) {
            ForEach(logs, id: \.timeStamp) { log in
                HistoryItemView(for: log)
            }
        }
    }

    init(for logs: [TrackingStepViewModel]){
        self.logs = logs
    }

}

struct HistoryItemView: View {

    var history: TrackingStepViewModel

    var body: some View {
        VStack (alignment: .leading) {
            Text(history.currentlyIn)
                .font(.headline)
                .bold()
                .foregroundColor(.blue)
            Text(history.status)
            HStack{
                Spacer()
                Text(history.timeStamp)
                    .font(.footnote)
            }
        }
    }

    init(for history: TrackingStepViewModel){
        self.history = history
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowShipmentDetailsUIView()
    }
}
