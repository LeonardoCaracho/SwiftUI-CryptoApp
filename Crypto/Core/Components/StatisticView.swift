//
//  StatisticView.swift
//  Crypto
//
//  Created by Leonardo Caracho on 21/07/23.
//

import SwiftUI

struct StatisticView: View {
    let stat: Statistic

    var body: some View {
        VStack(alignment: .leading) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondary)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack {
                Image(systemName:  "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) > 0 ? 0 : 180)
                    )
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) > 0 ? Color.green : Color.red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.stat1)
            StatisticView(stat: dev.stat2)
            StatisticView(stat: dev.stat3)
        }
    }
}
