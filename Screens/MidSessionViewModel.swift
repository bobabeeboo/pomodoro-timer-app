//
//  MidSessionViewModel.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-04.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var intervalNum = 3
    @Published var intervalLength = 25 * 60
    @Published var breakLength = 5 * 60
    @Published var intentions = Array(repeating: "", count: 3)
    @Published var currentInterval = 0
    @Published var timerIsActive = true
    @Published var onBreak = false
    @Published var timeRemaining: Int
    
    init(intervalNum: Int = 3, intervalLength: Int = 25 * 60, breakLength: Int = 5 * 60, intentions: Swift.Array<String> = Array(repeating: "", count: 3), timeRemaining: Int = 0, currentInterval: Int = 0, timerIsActive: Bool = true, onBreak: Bool = false) {
        self.intervalNum = intervalNum
        self.intervalLength = intervalLength
        self.breakLength = breakLength
        self.intentions = intentions
        self.timeRemaining = intervalLength
        self.currentInterval = currentInterval
        self.timerIsActive = timerIsActive
        self.onBreak = onBreak
    }
    
    func updateInterval() {
        // if current interval ISN'T the last interval & the timer is over, begin next interval/break
        if currentInterval < intervalNum && timeRemaining <= 0 {
            
            // if user just finished a break
            if onBreak {
                // move to next interval
                onBreak = false
                currentInterval += 1
                timeRemaining = intervalLength
                timerIsActive = true
            
            // if user just finished an intention interval
            } else if currentInterval < intervalNum - 1 {
                // start break
                onBreak = true
                timeRemaining = breakLength
                timerIsActive = true
            }
            
        }
    }
}
