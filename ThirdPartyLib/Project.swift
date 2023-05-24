import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLib",
    packages: [
        .RxSwift,
        .Realm,
        .Moya,
        .Loaf,
        .Kingfisher
    ],
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.RxSwift,
        .SPM.Realm,
        .SPM.RealmSwift,
        .SPM.RxCocoa,
        .SPM.RxMoya,
        .SPM.Loaf,
        .SPM.Kingfisher
    ]
)
