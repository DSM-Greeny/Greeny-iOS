import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.dynamicFramework(
    name: "Service",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
)
