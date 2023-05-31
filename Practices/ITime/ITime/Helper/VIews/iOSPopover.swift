//
//  iOSPopover.swift
//  ITime
//
//  Created by 蔡志文 on 5/19/23.
//

import SwiftUI


extension View {
  @ViewBuilder
  func iOSPopover<Content: View>(isPresented: Binding<Bool>, arrowDirection: UIPopoverArrowDirection, backgroundColor: Color = .white, @ViewBuilder content: @escaping () -> Content) -> some View {
    self.background {
      PopoverController(isPresented: isPresented, backgroundColor: backgroundColor, arrowDirection: arrowDirection, content: content())
    }
  }
}

struct PopoverController<Content: View>: UIViewControllerRepresentable {
  @Binding var isPresented: Bool
  @State private var alreadyPresented: Bool = false
  let backgroundColor: Color

  var arrowDirection: UIPopoverArrowDirection
  var content: Content

  func makeUIViewController(context: Context) -> UIViewController {
    let controller = UIViewController()
    return controller
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    if alreadyPresented {
      if let hostingController = uiViewController.presentedViewController as? CustomHostingView<Content> {
        // update rootView when swiftUI View changed
        hostingController.rootView = content
        hostingController.preferredContentSize = hostingController.view.intrinsicContentSize
      }

      if !isPresented {
        uiViewController.dismiss(animated: true) {
          alreadyPresented = false
        }
      }
    } else {
      if isPresented {
        let controller = CustomHostingView(rootView: content)
        controller.view.backgroundColor = .clear
        controller.modalPresentationStyle = .popover
        controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
        controller.popoverPresentationController?.sourceView = uiViewController.view
        controller.popoverPresentationController?.backgroundColor = UIColor(backgroundColor)
        controller.presentationController?.delegate = context.coordinator
        uiViewController.present(controller, animated: true)
      }
    }
  }

  class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
    var parent: PopoverController
    init(parent: PopoverController) {
      self.parent = parent
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
      return .none
    }

    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
      parent.isPresented = false
    }

    func presentationController(_ presentationController: UIPresentationController, willPresentWithAdaptiveStyle style: UIModalPresentationStyle, transitionCoordinator: UIViewControllerTransitionCoordinator?) {
      DispatchQueue.main.async {
        self.parent.alreadyPresented = true
      }
    }
  }
}

class CustomHostingView<Content: View>: UIHostingController<Content> {
  override func viewDidLoad() {
    super.viewDidLoad()
    preferredContentSize = view.intrinsicContentSize
  }
}
