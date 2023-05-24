import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.excutable(
    name: "iOS",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
    dependencies: []
)
