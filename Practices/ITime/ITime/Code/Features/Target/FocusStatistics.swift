//
//  FocusStatistics.swift
//  ITime
//
//  Created by 蔡志文 on 5/29/23.
//

import SwiftUI

struct FocusStatistics: View {

  @Environment(\.presentationMode) var presentationMode
  @State private var focusIndex: Int = 0
  
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [Color("medium_blue"), Color("medium_blue"), Color("medium_blue").opacity(0.4)]),
        startPoint: .top,
        endPoint: .bottom)
      .edgesIgnoringSafeArea(.all)
      ScrollView {
        accumulateCount()
        todayCount()
        focusCount()
      }
    }
    .navigationBarBackButtonHidden()
    .toolbarColorScheme(.dark, for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color("medium_blue"), for: .navigationBar)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image("icon_back22x22")
          Text("时间专注统计")
            .foregroundColor(.white)
        }
      }
    }
  }

  func accumulateCount() -> some View {
    VStack {
      VStack(alignment: .leading) {
        Text("累计专注")
          .font(.system(size: 13))
        Spacer()
          .frame(height: 15)
        HStack {
          VStack(spacing: 8) {
            Text("次数")
              .font(.caption)
            Text("1")
              .font(.subheadline)
              .bold()
          }
          .frame(maxWidth: .infinity)

          VStack(spacing: 8) {
            Text("时长")
              .font(.caption)
            HStack(spacing: 0) {
              Text("1")
                .font(.subheadline)
                .bold()
              Text("分钟")
                .font(.system(size: 8))
                .baselineOffset(-4)
            }
          }
          .frame(maxWidth: .infinity)

          VStack(spacing: 8) {
            Text("日均时长")
              .font(.caption)
            HStack(spacing: 0) {
              Text("1")
                .font(.subheadline)
                .bold()
              Text("分钟")
                .font(.system(size: 8))
                .baselineOffset(-4)
            }
          }
          .frame(maxWidth: .infinity)
        }
      }
      .padding(.leading, 10)
      .padding(.vertical, 10)
    }
    .frame(maxWidth: .infinity, idealHeight: 100, alignment: .leading)
    .background(Color.white)
    .cornerRadius(10)
    .padding(.horizontal, 10)
  }

  func todayCount() -> some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
          Text("当日专注")
            .font(.system(size: 13))
          Text("今天")
            .font(.system(size: 13))
          Spacer()
          Group {
            Button {

            } label: {
              Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }

            Button {

            } label: {
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }
          }
          .padding(.trailing, 10)
        }
        Spacer()
          .frame(height: 15)
        HStack {
          VStack(spacing: 8) {
            Text("次数")
              .font(.caption)
            Text("0")
              .font(.subheadline)
              .bold()
          }
          .frame(maxWidth: .infinity)

          VStack(spacing: 8) {
            Text("时长")
              .font(.caption)
            HStack(spacing: 0) {
              Text("0")
                .font(.subheadline)
                .bold()
              Text("分钟")
                .font(.system(size: 8))
                .baselineOffset(-4)
            }
          }
          .frame(maxWidth: .infinity)
        }
      }
      .padding(.leading, 10)
      .padding(.vertical, 10)
    }
    .frame(maxWidth: .infinity, idealHeight: 100, alignment: .leading)
    .background(Color.white)
    .cornerRadius(10)
    .padding(.horizontal, 10)
  }

  func focusCount() -> some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
          Text("当日专注")
            .font(.system(size: 13))
          Text("今天")
            .font(.system(size: 13))
          Spacer()
          Group {
            Button {

            } label: {
              Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }

            Button {

            } label: {
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }
          }
          .padding(.trailing, 10)
        }
        Spacer()
          .frame(height: 15)
        VStack(alignment: .center) {
          HStack {
            Spacer()
            SegmentedView(color: Color.white, selectedColor: Color("medium_blue"), selectedIndex: $focusIndex, itemSize: 60, style: .roundCorner(5)) {
              Text("日")
              Text("周")
              Text("月")
              Text("年")
            }
            .font(.subheadline)
            .frame(height: 30)
            Spacer()
          }

          Text("没有专注记录，点击目标开始按钮来专注计时吧")
            .font(.caption2)
            .foregroundColor(Color.gray)
            .padding(.vertical, 50)
        }
      }
      .padding(.leading, 10)
      .padding(.vertical, 10)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .cornerRadius(10)
    .padding(.horizontal, 10)
  }
}

struct FocusStatistics_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      FocusStatistics()
    }
  }
}
