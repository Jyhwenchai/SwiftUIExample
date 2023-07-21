//
//  Home.swift
//  Task Management
//
//  Created by 蔡志文 on 7/19/23.
//

import SwiftUI

struct Home: View {
  @State private var currentDate: Date = .init()
  @State private var weekSlider: [[Date.WeekDay]] = []
  @State private var currentWeekIndex: Int = 1
  @State private var createWeek: Bool = false
  @State private var tasks: [Task] = smapleTasks.sorted { $1.creationDate > $0.creationDate }
  @State private var createNewTask: Bool = false
  /// Animation Namespace
  @Namespace private var animation

  var body: some View {
    VStack(alignment: .leading, spacing: 0, content: {
      HeaderView()

      ScrollView(.vertical) {
        VStack {
          TasksView()
        }
        .hSpacing(.center)
        .vSpacing(.center)
      }
      .scrollIndicators(.hidden)

    })
    .vSpacing(.top)
    .overlay(alignment: .bottomTrailing, content: {
      Button(action: {
        createNewTask.toggle()
      }, label: {
        Image(systemName: "plus")
          .fontWeight(.semibold)
          .foregroundStyle(.white)
          .frame(width: 55, height: 55)
          .background(.darkBlue.shadow(.drop(color: .black.opacity(0.25), radius: 5, x: 10, y: 10)), in: .circle)
      })
      .padding(15)
    })
    .onAppear {
      if weekSlider.isEmpty {
        let currentWeek = currentDate.fetchWeek()
        print(currentWeek)
        if let firstDate = currentWeek.first?.date {
          weekSlider.append(firstDate.createPreviousWeek())
        }

        weekSlider.append(currentWeek)

        if let nextDate = currentWeek.last?.date {
          weekSlider.append(nextDate.createNextWeek())
        }
      }
    }
    .sheet(isPresented: $createNewTask, content: {
      NewTaskView()
        .presentationDetents([.height(300)])
        .interactiveDismissDisabled()
        .presentationCornerRadius(30)
        .presentationBackground(.BG)
    })
  }

  /// Header View
  @ViewBuilder
  func HeaderView() -> some View {
    VStack(alignment: .leading, spacing: 6) {
      HStack(spacing: 5) {
        Text(currentDate.format("MMMM"))
          .foregroundStyle(.darkBlue)

        Text(currentDate.format("YYYY"))
          .foregroundStyle(.gray)
      }
      .font(.title.bold())

      Text(currentDate.formatted(date: .complete, time: .omitted))
        .font(.callout)
        .fontWeight(.semibold)
        .textScale(.secondary)
        .foregroundStyle(.gray)

      /// Week Slider
      TabView(selection: $currentWeekIndex) {
        ForEach(weekSlider.indices, id: \.self) { index in
          let week = weekSlider[index]
          WeekView(week)
            .padding(.horizontal, 15)
            .tag(index)
        }
      }
      .padding(.horizontal, -15)
      .tabViewStyle(.page(indexDisplayMode: .never))
      .frame(height: 90)
    }
    .hSpacing(.leading)
    .overlay(alignment: .topTrailing, content: {
      Button(action: {}, label: {
        Image(.head)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 45, height: 45)
          .clipShape(.circle)
      })
    })
    .padding(15)
    .background(.white)
    /// 监听 currentWeekIndex 的变化，当手势分页时执行
    .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
      /// 创建新的一周当滑动到上一页或下一页
      if newValue == 0 || newValue == (weekSlider.count - 1) {
        createWeek = true
      }
    }
  }

  /// Tasks View
  @ViewBuilder
  func TasksView() -> some View {
    VStack(alignment: .leading, spacing: 35) {
      ForEach($tasks) { $task in
        TaskRowView(task: $task)
          .background(alignment: .leading) {
            if tasks.last?.id != task.id {
              Rectangle()
                .frame(width: 1)
                .offset(x: 8)
                .padding(.bottom, -35)
            }
          }
      }
    }
    .padding([.vertical, .leading], 15)
    .padding(.top, 15)
  }

  /// Week View
  @ViewBuilder
  func WeekView(_ week: [Date.WeekDay]) -> some View {
    HStack(spacing: 0) {
      ForEach(week) { day in
        VStack(spacing: 8) {
          Text(day.date.format("E"))
            .font(.callout)
            .fontWeight(.medium)
            .textScale(.secondary)
            .foregroundStyle(.gray)

          Text(day.date.format("dd"))
            .font(.callout)
            .fontWeight(.bold)
            .textScale(.secondary)
            .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
            .frame(width: 35, height: 35)
            .background(content: {
              if isSameDate(day.date, currentDate) {
                Circle()
                  .fill(.darkBlue)
                /// 匹配几何效果（动画）
                  .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
              }

              /// 指示器
              if day.date.isToday {
                Circle()
                  .fill(.cyan)
                  .frame(width: 5, height: 5)
                  .vSpacing(.bottom)
                  .offset(y: 12)
              }
            })
            .background(.white.shadow(.drop(radius: 1)), in: .circle)
        }
        .hSpacing(.center)
        /// 内容的可点击形状
        .contentShape(.rect)
        .onTapGesture {
          withAnimation {
            /// 更新日期
            currentDate = day.date
          }
        }
      }
    }
    .background {
      GeometryReader {
        /// 监听当前的 WeeKView 位置发生的变化
        let minX = $0.frame(in: .global).minX

        Color.clear
          .preference(key: OffsetKey.self, value: minX)
          .onPreferenceChange(OffsetKey.self) { value in
            /// 当偏移值达到15时创建上一周或下一周
            if value.rounded() == 15 && createWeek {
              paginateWeek()
              createWeek = false
            }
          }
      }
    }
  }

  func paginateWeek() {
    if weekSlider.indices.contains(currentWeekIndex) {
      if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
        weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
        weekSlider.removeLast()
        currentWeekIndex = 1
      }

      if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
        weekSlider.append(lastDate.createNextWeek())
        weekSlider.removeFirst()
        currentWeekIndex = weekSlider.count - 2
      }
    }
  }
}

#Preview {
  ContentView()
}
