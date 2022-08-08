////
////  Charts.swift
////  ProgressBar
////
////  Created by Truong Tommy on 3/20/22.
////
//
//import SwiftUI
//import SwiftUICharts
//
//struct Charts: View {
//
//    var body: some View {
//        ScrollView{
//        VStack {
//            
//            let busy = Legend(color: .red, label: "Busy", order: 3)
//            let normal = Legend(color: .blue, label: "Normal", order: 2)
//            let low = Legend(color: .gray, label: "Low", order: 1)
//
//            let points: [DataPoint] = [
//                .init(value: 10, label: "7a", legend: low),
//                .init(value: 40, label: "", legend: normal),
//                .init(value: 71, label: "", legend: normal),
//                .init(value: 92, label: "10a", legend: normal),
//                .init(value: 110, label: "", legend: normal),
//                .init(value: 124, label: "12p", legend: busy),
//                .init(value: 135, label: "", legend: busy),
//                .init(value: 133, label: "", legend: busy),
//                .init(value: 136, label: "3p", legend: busy),
//                .init(value: 90, label: "", legend: normal),
//                .init(value: 80, label: "", legend: normal),
//                .init(value: 75, label: "6p", legend: normal),
//                .init(value: 60, label: "", legend: normal),
//                .init(value: 45, label: "", legend: normal),
//                .init(value: 30, label: "9p", legend: low),
//                .init(value: 15, label: "", legend: low)
//
//            ]
//            Text("Popular Times")
//            BarChartView(dataPoints: points)
//                .padding()
//
//
//        }
//            
//        }
//        
//    }
//}
//
//struct Charts_Previews: PreviewProvider {
//    static var previews: some View {
//        Charts()
//    }
//}
