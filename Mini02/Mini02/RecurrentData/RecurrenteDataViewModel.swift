//
//  RecurrenteDataViewModel.swift
//  Mini02
//
//  Created by Kaua Miguel on 29/09/23.
//

import UIKit

class RecurrenteDataViewModel {
    let coreDataManager = CoreDataFunctions()
    
    //Get the last consult in the array of consults
    func getLastConsult() -> ConsultEntity?{
        coreDataManager.fetchPacient()
        
        let consults = coreDataManager.getConsults()
        
        guard let lastConsult = consults.last else {return nil}
        return lastConsult
    }
}
