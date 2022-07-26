//
//  ListButtonStack.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct ListButtonStack: View {

    @ObservedObject var viewModel: ListViewModel

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ListButton(buttonType: .all, viewModel: viewModel)
                ListButton(buttonType: .groceries, viewModel: viewModel)
                ListButton(buttonType: .work, viewModel: viewModel)
                ListButton(buttonType: .school, viewModel: viewModel)
                ListButton(buttonType: .adventure, viewModel: viewModel)
                ListButton(buttonType: .home, viewModel: viewModel)
                ListButton(buttonType: .personal, viewModel: viewModel)
                ListButton(buttonType: .extra, viewModel: viewModel)

            }
        }
    }
}

struct ListButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        ListButtonStack(viewModel: ListViewModel())
    }
}

struct ListButton: View {

    let buttonType: SelectedButton
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        Button {
            viewModel.filterListSelected = buttonType

            if viewModel.filterListSelected != .all {
                viewModel.listsFiltered = viewModel.lists.filter { list in
                    return list.ListType == viewModel.filterListSelected.rawValue
                }
            } else {
                    viewModel.listsFiltered = viewModel.lists

            }

        } label: {
            Text("\(buttonType.getValue())")
                .foregroundColor(viewModel.filterListSelected == buttonType ? .black : Color(.systemGray))
                .frame(width: 88, height: 40)
                .background(buttonType == viewModel.filterListSelected ? Color("Yellow"): Color(.white))
                .cornerRadius(20)
        }
    }
}
