//
//  HomeEntity.swift
//  Greeny
//
//  Created by 김대희 on 2023/06/14.
//  Copyright © 2023 com.Greeny. All rights reserved.
//

import Foundation

struct HomeEntity: Hashable, Equatable {
    let title: String
    let subTitle: String
    let content: String
    let image: String
}

let homeData: [HomeEntity] = [
    .init(
        title: "제활용 쓰래기\n올바르게 버리고 계신가요?",
        subTitle: "제대로 된 쓰래기 배출 방법을 알려드릴깨요!",
        content: "",
        image: "main1"
    ),
    .init(
        title: "지속 가능한 농업\n유기농과 생태적인 농작물 재배",
        subTitle: "유기농의 개념과 장점, 생태계 등 많은 것들을 알려드릴깨요!",
        content: "",
        image: "main2"
    ),
    .init(
        title: "환경을 생각하는\n소비자를 위한 친환경 쇼핑몰 추천!",
        subTitle: "친환경 생활을 위한 쇼핑몰을 모아봤어요.",
        content: "",
        image: "main3"
    ),
    .init(
        title: "환경을 위한 혁신과\n함께하는 친환경 뉴스레터",
        subTitle: "지구를 위한 긍정적인 변화를 위해\n우리가 알아야 할 친환경 소식과 행사를 알려드릴깨요!",
        content: "",
        image: "main4"
    ),
    .init(
        title: "환경을 사랑하는\n우리 모두를 위한 친환경 행사와 이니셔티브 소식",
        subTitle: "지속 가능한 미래를 위해 함께하는 친환경 행사와 혁신적인 이니셔티브에 대한 소식을 알려드립니다.",
        content: "",
        image: "main5"
    )
]
