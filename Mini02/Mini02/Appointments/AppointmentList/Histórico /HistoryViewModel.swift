//
//  HistoryViewModel.swift
//  Mini02
//
//  Created by Kaua Miguel on 11/10/23.
//

import Foundation

class HistoryViewModel{
    let coreDataMaanger = CoreDataFunctions()
    
    func getPatient() -> Pacient?{
        coreDataMaanger.fetchPacient()
        if let patient = coreDataMaanger.pacient{
            return patient
        }
        return nil
    }
}
