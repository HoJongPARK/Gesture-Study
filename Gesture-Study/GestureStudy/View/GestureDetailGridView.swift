//
//  GestureDetailGridView.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI

// MARK: 제스처 디테일 그리드뷰
struct GestureDetailGridView: View {

  private let category: GestureCategory

  init(category gestureCategory: GestureCategory) {
    self.category = gestureCategory
  }

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      gridView
    }
    .padding(.top, 20)
    .padding(.horizontal, 8)
    .navigationTitle(category.categoryEnNm)
    .background(Color.background.edgesIgnoringSafeArea(.all))
  }

  private var gridView: some View {
    LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 14) {
      ForEach([Tap()]) { detail in
        GestureDetailGridItem(gestureDetail: detail)
      }
    }
  }
}
// MARK: 제스처 디테일 그리드 아이템
struct GestureDetailGridItem<Detail: GestureDetailProtocol>: View {

  let gestureDetail: Detail

  var body: some View {
    VStack(alignment: .center, spacing: 2) {
      gestureDetail.image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 52, height: 52)
        .foregroundColor(.brand)
        .padding(.init(top: 34, leading: 0, bottom: 25, trailing: 0))

      Text(gestureDetail.enNm)
        .font(.title3)
        .bold()

      Text(gestureDetail.korNm)
        .font(.caption)
        .foregroundColor(.subText)
        .padding(.bottom, 10)
    }
    .lineLimit(1)
    .frame(maxWidth: 300)
    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gridItemBackground).shadow(radius: 2))
    .padding(.horizontal, 8)
  }
}
// MARK: 제스처 디테일 프리뷰
struct GestureDetailGridView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GestureDetailGridView(category: .tap)
        .preferredColorScheme(.dark)
    }
  }
}
