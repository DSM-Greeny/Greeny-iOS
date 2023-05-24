import SwiftUI

struct GreenyNavigationLink<Destination>: View where Destination: View {
    let title: String
    let destination: () -> Destination
    
    var body: some View {
        NavigationLink(destination: destination, label: {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color("66A865"))
                .cornerRadius(5)
        })
    }
}
